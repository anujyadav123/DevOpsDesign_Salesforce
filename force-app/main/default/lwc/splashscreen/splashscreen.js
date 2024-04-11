import { LightningElement } from 'lwc';

import { NavigationMixin } from 'lightning/navigation';
import BRAZEN_LOGO from '@salesforce/resourceUrl/SiteSamples';
import BRAZEN_LOGOO from '@salesforce/resourceUrl/cxzc';

export default class splashscreen extends  NavigationMixin(LightningElement) {
            trailheadLogoUrl = BRAZEN_LOGO;
            trailheadLogoUrll = BRAZEN_LOGOO;
            
            
              
         
                handleCancel() {
              
                    this[NavigationMixin.Navigate]({
                       type: 'comm__namedPage',
                       attributes: {
                           name: 'createform__c'
                       },
                       state: {
                           emailParameter: 'email@email.com'
                       }
                   });
    

    }}