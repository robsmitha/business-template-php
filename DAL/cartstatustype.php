<?php
/*
Author:			This code was generated by DALGen version 1.1.0.0 available at https://github.com/H0r53/DALGen
Date:			12/9/2017
Description:	Creates the DAL class for  statustype table and respective stored procedures

*/



class Cartstatustype {

    // This is for local purposes only! In hosted environments the db_settings.php file should be outside of the webroot, such as: include("/outside-webroot/db_settings.php");
    protected static function getDbSettings() { return "DAL/db_localsettings.php"; }

    /******************************************************************/
    // Properties
    /******************************************************************/

    protected $Id;
    protected $Name;
    protected $Description;


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
            case 3:
                self::__constructFull( $argv[0], $argv[1], $argv[2] );
        }
    }


    public function __constructBase() {
        $this->Id = 0;
        $this->Name = "";
        $this->Description = "";
    }


    public function __constructPK($paramId) {
        $this->load($paramId);
    }


    public function __constructFull($paramId,$paramName,$paramDescription) {
        $this->Id = $paramId;
        $this->Name = $paramName;
        $this->Description = $paramDescription;
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
    public function getName(){
        return $this->Name;
    }
    public function setName($value){
        $this->Name = $value;
    }
    public function getDescription(){
        return $this->Description;
    }
    public function setDescription($value){
        $this->Description = $value;
    }


    /******************************************************************/
    // Public Methods
    /******************************************************************/


    public function load($paramId) {
        include(self::getDbSettings());
        $conn = new mysqli($servername, $username, $password, $dbname);
        $stmt = $conn->prepare('CALL usp_cartstatustype_Load(?)');
        $stmt->bind_param('i', $paramId);
        $stmt->execute();

        $result = $stmt->get_result();
        if (!$result) die($conn->error);

        while ($row = $result->fetch_assoc()) {
            $this->setId($row['Id']);
            $this->setName($row['Name']);
            $this->setDescription($row['Description']);
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
        $stmt = $conn->prepare('CALL usp_cartstatustype_Add(?,?)');
        $arg1 = $this->getName();
        $arg2 = $this->getDescription();
        $stmt->bind_param('ss',$arg1,$arg2);
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
        $stmt = $conn->prepare('CALL usp_cartstatustype_Update(?,?,?)');
        $arg1 = $this->getId();
        $arg2 = $this->getName();
        $arg3 = $this->getDescription();
        $stmt->bind_param('iss',$arg1,$arg2,$arg3);
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
        $stmt = $conn->prepare('CALL usp_cartstatustype_LoadAll()');
        $stmt->execute();

        $result = $stmt->get_result();
        if (!$result) die($conn->error);
        if ($result->num_rows > 0) {
            $arr = array();
            while ($row = $result->fetch_assoc()) {
                $statustype = new Cartstatustype($row['Id'],$row['Name'],$row['Description']);
                $arr[] = $statustype;
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
        $stmt = $conn->prepare('CALL usp_cartstatustype_Delete(?)');
        $stmt->bind_param('i', $paramId);
        $stmt->execute();
    }


    public static function search($paramId,$paramName,$paramDescription) {
        include(self::getDbSettings());
        $conn = new mysqli($servername, $username, $password, $dbname);
        $stmt = $conn->prepare('CALL usp_cartstatustype_Search(?,?,?)');
        $arg1 = Cartstatustype::setNullValue($paramId);
        $arg2 = Cartstatustype::setNullValue($paramName);
        $arg3 = Cartstatustype::setNullValue($paramDescription);
        $stmt->bind_param('iss',$arg1,$arg2,$arg3);
        $stmt->execute();

        $result = $stmt->get_result();
        if (!$result) die($conn->error);
        if ($result->num_rows > 0) {
            $arr = array();
            while ($row = $result->fetch_assoc()) {
                $statustype = new Cartstatustype($row['Id'],$row['Name'],$row['Description']);
                $arr[] = $statustype;
            }
            return $arr;
        }
        else {
            //die("The query yielded zero results.No rows found.");
        }
    }
}
