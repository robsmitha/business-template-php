<?php
/*
Author:			This code was generated by /var/wwwGen version 1.1.0.0 available at https://github.com/H0r53/DALGen
Date:			12/16/2017
Description:	Creates the DAL class for  blogcomment table and respective stored procedures

*/



class Blogcomment {

	// This is for local purposes only! In hosted environments the db_settings.php file should be outside of the webroot, such as: include("/outside-webroot/db_settings.php");
	protected static function getDbSettings() { return "DAL/db_localsettings.php"; }

	/******************************************************************/
	// Properties
	/******************************************************************/

	protected $Id;
	protected $Comment;
	protected $CustomerId;
	protected $BlogCommentStatusTypeId;
	protected $BlogId;
	protected $CreateDate;
	protected $EditDate;


	/******************************************************************/
	// Constructors
	/******************************************************************/
	public function __construct() {
		$argv = func_get_args();
		switch( func_num_args() ) {
			case 0:
				self::__constructBase();
				break;
			case 1:
				self::__constructPK( $argv[0] );
				break;
			case 7:
				self::__constructFull( $argv[0], $argv[1], $argv[2], $argv[3], $argv[4], $argv[5], $argv[6] );
		}
	}


	public function __constructBase() {
		$this->Id = 0;
		$this->Comment = "";
		$this->CustomerId = 0;
		$this->BlogCommentStatusTypeId = 0;
		$this->BlogId = 0;
		$this->CreateDate = "";
		$this->EditDate = "";
	}


	public function __constructPK($paramId) {
		$this->load($paramId);
	}


	public function __constructFull($paramId,$paramComment,$paramCustomerId,$paramBlogCommentStatusTypeId,$paramBlogId,$paramCreateDate,$paramEditDate) {
		$this->Id = $paramId;
		$this->Comment = $paramComment;
		$this->CustomerId = $paramCustomerId;
		$this->BlogCommentStatusTypeId = $paramBlogCommentStatusTypeId;
		$this->BlogId = $paramBlogId;
		$this->CreateDate = $paramCreateDate;
		$this->EditDate = $paramEditDate;
	}


	/******************************************************************/
	// Accessors / Mutators
	/******************************************************************/

	public function getId(){
		return $this->Id;
	}
	public function setId($value){
		$this->Id = $value;
	}
	public function getComment(){
		return $this->Comment;
	}
	public function setComment($value){
		$this->Comment = $value;
	}
	public function getCustomerId(){
		return $this->CustomerId;
	}
	public function setCustomerId($value){
		$this->CustomerId = $value;
	}
	public function getBlogCommentStatusTypeId(){
		return $this->BlogCommentStatusTypeId;
	}
	public function setBlogCommentStatusTypeId($value){
		$this->BlogCommentStatusTypeId = $value;
	}
	public function getBlogId(){
		return $this->BlogId;
	}
	public function setBlogId($value){
		$this->BlogId = $value;
	}
	public function getCreateDate(){
		return $this->CreateDate;
	}
	public function setCreateDate($value){
		$this->CreateDate = $value;
	}
	public function getEditDate(){
		return $this->EditDate;
	}
	public function setEditDate($value){
		$this->EditDate = $value;
	}


	/******************************************************************/
	// Public Methods
	/******************************************************************/


	public function load($paramId) {
		include(self::getDbSettings());
		$conn = new mysqli($servername, $username, $password, $dbname);
		$stmt = $conn->prepare('CALL usp_blogcomment_Load(?)');
		$stmt->bind_param('i', $paramId);
		$stmt->execute();

		$result = $stmt->get_result();
		if (!$result) die($conn->error);

		while ($row = $result->fetch_assoc()) {
		 $this->setId($row['Id']);
		 $this->setComment($row['Comment']);
		 $this->setCustomerId($row['CustomerId']);
		 $this->setBlogCommentStatusTypeId($row['BlogCommentStatusTypeId']);
		 $this->setBlogId($row['BlogId']);
		 $this->setCreateDate($row['CreateDate']);
		 $this->setEditDate($row['EditDate']);
		}
	}


	public function save() {
		if ($this->getId() == 0)
			$this->insert();
		else
			$this->update();
	}

	/******************************************************************/
	// Private Methods
	/******************************************************************/



	private function insert() {
		include(self::getDbSettings());
		$conn = new mysqli($servername, $username, $password, $dbname);
		$stmt = $conn->prepare('CALL usp_blogcomment_Add(?,?,?,?,?,?)');
		$arg1 = $this->getComment();
		$arg2 = $this->getCustomerId();
		$arg3 = $this->getBlogCommentStatusTypeId();
		$arg4 = $this->getBlogId();
		$arg5 = $this->getCreateDate();
		$arg6 = $this->getEditDate();
		$stmt->bind_param('siiiss',$arg1,$arg2,$arg3,$arg4,$arg5,$arg6);
		$stmt->execute();

		$result = $stmt->get_result();
		if (!$result) die($conn->error);
		while ($row = $result->fetch_assoc()) {
			// By default, the DALGen generated INSERT procedure returns the scope identity as id
			$this->load($row['id']);
		}
	}


	private function update() {
		include(self::getDbSettings());
		$conn = new mysqli($servername, $username, $password, $dbname);
		$stmt = $conn->prepare('CALL usp_blogcomment_Update(?,?,?,?,?,?,?)');
		$arg1 = $this->getId();
		$arg2 = $this->getComment();
		$arg3 = $this->getCustomerId();
		$arg4 = $this->getBlogCommentStatusTypeId();
		$arg5 = $this->getBlogId();
		$arg6 = $this->getCreateDate();
		$arg7 = $this->getEditDate();
		$stmt->bind_param('isiiiss',$arg1,$arg2,$arg3,$arg4,$arg5,$arg6,$arg7);
		$stmt->execute();
	}

	private static function setNullValue($value){
		if ($value == "")
			return null;
		else
			return $value;
	}

	/******************************************************************/
	// Static Methods
	/******************************************************************/



	public static function loadall() {
		include(self::getDbSettings());
		$conn = new mysqli($servername, $username, $password, $dbname);
		$stmt = $conn->prepare('CALL usp_blogcomment_LoadAll()');
		$stmt->execute();

		$result = $stmt->get_result();
		if (!$result) die($conn->error);
		if ($result->num_rows > 0) {
			$arr = array();
			while ($row = $result->fetch_assoc()) {
				$blogcomment = new Blogcomment($row['Id'],$row['Comment'],$row['CustomerId'],$row['BlogCommentStatusTypeId'],$row['BlogId'],$row['CreateDate'],$row['EditDate']);
				$arr[] = $blogcomment;
			}
			return $arr;
		}
		else {
			//die("The query yielded zero results.No rows found.");
		}
	}


	public static function remove($paramId) {
		include(self::getDbSettings());
		$conn = new mysqli($servername, $username, $password, $dbname);
		$stmt = $conn->prepare('CALL usp_blogcomment_Delete(?)');
		$stmt->bind_param('i', $paramId);
		$stmt->execute();
	}


	public static function search($paramId,$paramComment,$paramCustomerId,$paramBlogCommentStatusTypeId,$paramBlogId,$paramCreateDate,$paramEditDate) {
		include(self::getDbSettings());
		$conn = new mysqli($servername, $username, $password, $dbname);
		$stmt = $conn->prepare('CALL usp_blogcomment_Search(?,?,?,?,?,?,?)');
		$arg1 = Blogcomment::setNullValue($paramId);
		$arg2 = Blogcomment::setNullValue($paramComment);
		$arg3 = Blogcomment::setNullValue($paramCustomerId);
		$arg4 = Blogcomment::setNullValue($paramBlogCommentStatusTypeId);
		$arg5 = Blogcomment::setNullValue($paramBlogId);
		$arg6 = Blogcomment::setNullValue($paramCreateDate);
		$arg7 = Blogcomment::setNullValue($paramEditDate);
		$stmt->bind_param('isiiiss',$arg1,$arg2,$arg3,$arg4,$arg5,$arg6,$arg7);
		$stmt->execute();

		$result = $stmt->get_result();
		if (!$result) die($conn->error);
		if ($result->num_rows > 0) {
			$arr = array();
			while ($row = $result->fetch_assoc()) {
				$blogcomment = new Blogcomment($row['Id'],$row['Comment'],$row['CustomerId'],$row['BlogCommentStatusTypeId'],$row['BlogId'],$row['CreateDate'],$row['EditDate']);
				$arr[] = $blogcomment;
			}
			return $arr;
		}
		else {
			//die("The query yielded zero results.No rows found.");
		}
	}
    public static function loadbyblogid($paramBlogId) {
        include(self::getDbSettings());
        $conn = new mysqli($servername, $username, $password, $dbname);
        $stmt = $conn->prepare('CALL usp_blogcomment_LoadByBlogId(?)');
        $stmt->bind_param('i', $paramBlogId);
        $stmt->execute();
        $result = $stmt->get_result();
        if (!$result) die($conn->error);
        if ($result->num_rows > 0) {
            $arr = array();
            while ($row = $result->fetch_assoc()) {
                $blogcomment = new Blogcomment($row['Id'],$row['Comment'],$row['CustomerId'],$row['BlogCommentStatusTypeId'],$row['BlogId'],$row['CreateDate'],$row['EditDate']);
                $arr[] = $blogcomment;
            }
            return $arr;
        }
        else {
            //echo "The query yielded zero results.No rows found.";
        }
    }
}
