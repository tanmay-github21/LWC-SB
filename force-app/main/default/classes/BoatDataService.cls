public with sharing class BoatDataService {
    public static final String LENGTH_TYPE= 'length';
    public static final String PRICE_TYPE= 'price';
    public static final string TYPE_TYPE= 'Type'; 
    @AuraEnabled(cacheable=true)
    public static List<Boat__c> getBoats(String boatTypeId)
    {
        string query= 'SELECT'
                       + 'Name, Description__c, Geolocation_Latitude__s,'
                       + 'Geolocation_Longitude__s, picture__c, Contact__r.Name'  
                       + 'Boattype__c, BoatType__r.name, Length__c, Price__c'
                       + 'From Boat__c';    
        if(string.isNotBlank(boatTypeId)){
            query += 'WHERE BoatType__c =: boatTypeId';
        }  
        return Database.query(query);             
    }
    @AuraEnabled(cacheable= true)
    public static List<Boat__c> getSimiliarBoatTypes(ID boatId, string similarBy){
        List<Boat__c> similiarBoats= new List <Boat__c> () ; 
        return similiarBoats;
    }

     @AuraEnabled(cacheable= true)
    public static List<BoatType__c> getBoatTypes(){
        return [Select Name, Id from Boattype__c WITH SECURITY_ENFORCED ORDER BY NAME]; 
    } 
   @AuraEnabled(cacheable=true)
    public static map<ID, BoatType__c> getBoatTypesMap()
    {
        List<BoatType__c> allBoats= new List<BoatType__c>();
        allBoats= [Select Name from BoatType__c ORDER BY NAME]; 
        Map<ID, BoatType__C> boatMap= new Map<ID, BoatType__C> (allBoats); 
        for(BoatType__c s: boatMap.values())
        System.debug(s);
        return boatMap; 
    } 
}
