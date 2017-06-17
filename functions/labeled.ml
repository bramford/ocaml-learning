let ratio ~num ~denom = num /. denom;;
ratio 3. 10.;;
ratio 10. 3.;;
ratio ~num:3. ~denom:10.;;
ratio ~denom:10. ~num:3.;;
