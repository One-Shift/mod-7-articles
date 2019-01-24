<?php

class c7_article {
	protected $id;
	protected $category_id;
	protected $title = [];
	protected $description = [];
	protected $code;
	protected $user_id;
	protected $date;
	protected $date_update;
	protected $published = false;

	public function __construct() {}

	public function setId($i) {
		$this->id = $i;
	}

	public function setLangId($li) {
		$this->lang_id = $li;
	}

	public function setCategoryId($ci) {
		$this->category_id = $ci;
	}

	public function setContent($t, $d) {
		$this->title = $t;
		$this->description = $d;
	}

	public function setCode($c) {
		$this->code = $c;
	}

	public function setUserId($u) {
		$this->user_id = $u;
	}

	public function setDate($d = null) {
		$this->date = ($d !== null) ? $d : date("Y-m-d H:i:s", time());
	}

	public function setDateUpdate($d = null) {
		$this->date_update = ($d !== null) ? $d : date("Y-m-d H:i:s", time());
	}

	public function setPublished($p) {
		$this->published = $p;
	}

	public function insert() {
		global $cfg, $db;

		$query[0] = sprintf("INSERT INTO %s_7_articles (code, user_id, date, date_update, published) VALUES ('%s', '%s', '%s', '%s', '%s')",
			$cfg->db->prefix,
			$this->code,
			$this->user_id,
			$this->date,
			$this->date_update,
			$this->published
		);

		if ($db->query($query[0])){
			$this->id = $db->insert_id;

			foreach ($this->title as $i => $item) {
				$query[1] = sprintf("INSERT INTO %s_7_articles_lang (article_id, lang_id, title, text) VALUES (%s, %s, '%s', '%s')",
					$cfg->db->prefix,
					$this->id,
					$i+1,
					$db->real_escape_string($this->title[$i]),
					$db->real_escape_string($this->description[$i])
				);

				$db->query($query[1]);
			}

			if(is_array($this->category_id)) {
				foreach ($this->category_id as $c => $cat) {

					$query[2] = sprintf("INSERT INTO %s_8_categories_rel (category_id, object_id, module, date, date_update) VALUES ('%s', %s, '%s', '%s', '%s')",
						$cfg->db->prefix,
						$cat,
						$this->id,
						"article",
						$this->date,
						$this->date_update
					);

					$db->query($query[2]);
				}
			}

			return true;
		}

		return false;
	}

	public function update() {
		global $cfg, $db;

		$toReturn = false;

		$query[0] = sprintf(
			"UPDATE %s_7_articles SET code = '%s', category_id = '%s', date = '%s', date_update = '%s', published = '%s', user_id = '%s' WHERE id = '%s'",
			$cfg->db->prefix,
			$this->code,
			$this->category_id,
			$this->date,
			$this->date_update,
			$this->published,
			$this->user_id,
			$this->id
		);

		if ($db->query($query[0])){
			$toReturn = true;

			foreach ($cfg->lg as $index => $lg) {
				if ($lg[0]) {
					$fast_query = sprintf(
						"SELECT id FROM %s_7_articles_lang WHERE article_id = %s AND lang_id = %s",
						$cfg->db->prefix,
						$this->id,
						$index
					);

					$fast_source = $db->query($fast_query);

					if ($fast_source->num_rows > 0) {
						$query[$index] = sprintf("UPDATE %s_7_articles_lang SET title = '%s', text = '%s' WHERE article_id = '%s' AND lang_id = '%s'",
							$cfg->db->prefix,
							$db->real_escape_string($this->title[$index-1]),
							$db->real_escape_string($this->description[$index-1]),
							$this->id,
							$index
						);

						$db->query($query[$index]);
					} else {
						$query[1] = sprintf("INSERT INTO %s_7_articles_lang (article_id, lang_id, title, text) VALUES (%s, %s, '%s', '%s')",
							$cfg->db->prefix,
							$this->id,
							$index,
							$db->real_escape_string($this->title[$index - 1]),
							$db->real_escape_string($this->description[$index - 1])
						);

						$db->query($query[1]);
					}
				}
			}

			if(is_array($this->category_id)) {
				$current_cats = self::returnRelCategories($this->id);
				$diff_del = array_diff($current_cats, $this->category_id);
				$diff_insert = array_diff($this->category_id, $current_cats);

				if(!empty($diff_insert)) {
					foreach ($diff_insert as $d => $di) {
						$query_insert = sprintf("INSERT INTO %s_8_categories_rel (category_id, object_id, module, date, date_update) VALUES ('%s', '%s', '%s', '%s', '%s')",
							$cfg->db->prefix, $di, $this->id, "article", $this->date, $this->date_update
						);

						$db->query($query_insert);
					}
				}

				if(!empty($diff_del)) {
					foreach ($diff_del as $d => $dd) {
						$query_del = sprintf("DELETE FROM %s_8_categories_rel WHERE category_id = %s AND object_id = %s AND module = '%s'",
							$cfg->db->prefix, $dd, $this->id, "article"
						);

						$db->query($query_del);
					}
				}
			}
		}

		return $toReturn;
	}

	public function delete() {
		global $cfg, $db, $authData;

		$article = new c7_article();
		$article->setId($this->id);
		$article_obj = $article->returnOneArticleAllLanguages();

		$trash = new trash();
		$trash->setCode(json_encode($article_obj));
		$trash->setDate();
		$trash->setModule($cfg->mdl->folder);
		$trash->setUser($authData["id"]);
		$trash->insert();

		$query = sprintf("DELETE c, cl
			FROM %s_7_articles c
				JOIN %s_7_articles_lang cl on cl.article_id = c.id
			WHERE c.id = %s",
				$cfg->db->prefix,
				$cfg->db->prefix,
				$this->id
		);

		$current_cats = self::returnRelCategories($this->id);

		if(count($current_cats) > 0 && is_array($current_cats)) {
			foreach ($current_cats as $c => $cats) {
				$query_del = sprintf("DELETE FROM %s_8_categories_rel WHERE category_id = %s AND object_id = %s AND module = '%s'",
					$cfg->db->prefix, $cats, $this->id, "article"
				);

				$db->query($query_del);
			}
		}

		$db->query($query);

		return ($article->returnOneArticleAllLanguages() == FALSE) ? TRUE : FALSE;
	}

	public function returnObject() {
		return get_object_vars($this);
	}

	public function returnAllArticles () {
		global $cfg, $db;

		$toReturn = [];

		$query = sprintf("SELECT bc.*, bcl.title, bc.id
			FROM %s_7_articles bc
				INNER JOIN %s_7_articles_lang bcl on bcl.article_id = bc.id
			WHERE bcl.lang_id = %s
			ORDER BY bc.date ASC, bcl.title ASC",
			$cfg->db->prefix, $cfg->db->prefix, $this->lang_id
		);

		$source = $db->query($query);

		while ($data = $source->fetch_object()) {
			$rel_array = [];

			$query_rel = sprintf(
				"SELECT * FROM %s_8_categories_rel WHERE object_id = %s",
				$cfg->db->prefix, $data->id

			);

			$source_rel = $db->query($query_rel);

			while ($data_rel = $source_rel->fetch_object()) {
				array_push($rel_array, $data_rel->category_id);
			}

			$data->categories_rel = $rel_array;
			array_push($toReturn, $data);
		}
		return $toReturn;
	}

	// Returns one categorie in one language need category id and lang id. $this->id, $this->lang_id
	public function returnOneArticle() {
		global $cfg, $db;

		$query = sprintf("SELECT bc.*, bcl.title, bcl.text
			FROM %s_7_articles bc
				INNER JOIN %s_7_articles_lang bcl on bcl.article_id = bc.id
			WHERE bc.id = %s and bcl.lang_id = %s",
			$cfg->db->prefix,
			$cfg->db->prefix,
			$this->id,
			$this->lang_id
		);

		$source = $db->query($query);

		$toReturn = $source->fetch_object();

		return $toReturn;
	}

	public function returnArticlesByCategory($where = null, $order = null, $limit = null) {
		global $cfg, $db;

	 	$query = sprintf(
			"SELECT bc.*, bcl.title, bcl.text, bcl.lang_id
				FROM %s_7_articles bc
					INNER JOIN %s_7_articles_lang bcl on bcl.article_id = bc.id
					INNER JOIN %s_8_categories_rel rcl on rcl.object_id = bc.id
				WHERE (%s) AND rcl.module = '%s' AND bcl.lang_id = %s AND rcl.category_id = %s
				%s %s",
			$cfg->db->prefix,
			$cfg->db->prefix,
			$cfg->db->prefix,
			(!empty($where)) ? $where : "true",
			"article",
			$this->lang_id,
			$this->category_id,
			($order !== null) ? "ORDER BY {$order}" : null,
			($limit !== null) ? "LIMIT {$limit}" : null
		);

		$source = $db->query($query);

		if ($source->num_rows > 0) {
			$toReturn = [];

			while ($data = $source->fetch_object()) {
				$rel_array = [];

				$query_rel = sprintf(
					"SELECT * FROM %s_8_categories_rel WHERE object_id = %s",
					$cfg->db->prefix, $data->id

				);

				$source_rel = $db->query($query_rel);

				while ($data_rel = $source_rel->fetch_object()) {
					array_push($rel_array, $data_rel->category_id);
				}

				$data->categories_rel = $rel_array;
				array_push($toReturn, $data);
			}

			return $toReturn;
		}

		return false;
	}

	public function returnRelCategories($id = null) {
		global $cfg, $db;


		if(isset($id) && !empty($id) && $id != 0) {
			$query = sprintf("SELECT * FROM %s_8_categories_rel WHERE object_id = %s",
				$cfg->db->prefix, $id
			);

			$source = $db->query($query);

			$toReturn = [];

			while ($data = $source->fetch_object()) {
				array_push($toReturn, $data->category_id);
			}

			return $toReturn;
		}

		return FALSE;
	}

	// Returns one categories in all languages need category id. $this->id
	public function returnOneArticleAllLanguages() {
		global $cfg, $db;

		$query = sprintf("SELECT bc.*, bcl.title, bcl.text, bcl.lang_id
			FROM %s_7_articles bc
				INNER JOIN %s_7_articles_lang bcl on bcl.article_id = bc.id
			WHERE bc.id = %s",
			$cfg->db->prefix, $cfg->db->prefix, $this->id
		);

		$source = $db->query($query);

		$toReturn = [];

		while ($data = $source->fetch_object()) {
			// Push to index lang_id, the result of that row
			$rel_array = [];

			$query_rel = sprintf(
				"SELECT * FROM %s_8_categories_rel WHERE object_id = %s",
				$cfg->db->prefix, $this->id

			);

			$source_rel = $db->query($query_rel);

			while ($data_rel = $source_rel->fetch_object()) {
				array_push($rel_array, $data_rel->category_id);
			}

			$data->categories_rel = $rel_array;

			$toReturn[$data->lang_id] = $data;
		}

		return $toReturn;

	}
}
