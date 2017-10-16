#This is a simple implementation of counting sort algorithm in perl.


#This sub routine takes two references as arguments.
#1. key_pt -> Array of integers on based which the sorting will happen.
#2. $val_pt -> Array of actual data. Values could be simple strings or complex data structures.

#This will return a pointer to a sorted array of actual data.
sub countingsort{

        my $key_pt=$_[0];
        my $val_pt=$_[1];
        my %helper_hash=();
        my $max_key=$key_pt->[0];
        
        foreach(@$key_pt){
        
            $helper_hash{$_}+=1;
            if($_ > $max_key){
                $max_key=$_;
            }
        }
        
        my @helper_arr=();
        for(my $k=0;$k<=$max_key;$k++){
            if(exists($helper_hash{$k})){
                $helper_arr[$k]=$helper_hash{$k};
            }
            else{
                $helper_arr[$k]=0;
            }
        }
        
        my $offset=0;
        foreach(@helper_arr){
            $_+=$offset;
            $offset=$_;
        }
        
        unshift(@helper_arr,0); 

        my @final_keyarr=();
        my @final_valarr=();
  
        for(my $j=0;$j<scalar(@$key_pt);$j++){

                $final_keyarr[$helper_arr[$key_pt->[$j]]]=$key_pt->[$j];
                $final_valarr[$helper_arr[$key_pt->[$j]]]=$val_pt->[$j];
                $helper_arr[$key_pt->[$j]]++;
        }
       
       return(\@final_valarr);
    
}
