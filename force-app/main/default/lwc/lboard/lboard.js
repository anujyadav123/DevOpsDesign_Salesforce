import { LightningElement, wire ,track} from 'lwc';
import getscore from '@salesforce/apex/quizcontroller.getlboard';

export default class Lboard extends LightningElement {
    @track score
    @wire(getscore,{})
    wiredgetqus({ error, data }) {
        if (data) {
          console.log('-- data returned --');     
          console.log("data",data);
          this.score = data;
          
    
        } else if (error) {
          console.log("error",error);
        }
}}