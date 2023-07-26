codeunit 50000 String
{
    procedure DecStr(String: Text): Text;
    var
        CharCount: Integer;
        StoreChr: Text;
        StoreStr: Text;
        ExitStr: Text;
        VerifyStr: Text;
        ValidateInt: Integer;
        ValidateWholeString: Boolean;
        ExitLoop: Boolean;
        SwitchCondition: Boolean;
    begin
        Clear(StoreChr);
        Clear(StoreStr);
        Clear(CharCount);
        Clear(ExitLoop);
        Clear(ExitStr);
        Clear(VerifyStr);
        Clear(SwitchCondition);
        Clear(ValidateWholeString);
        Clear(ValidateInt);

        repeat
            StoreChr := CopyStr(String, StrLen(String) - CharCount, 1);
            If Evaluate(ValidateInt, StoreChr) then begin
                StoreChr := StoreChr + StoreStr;
                StoreStr := StoreChr;
                CharCount += 1;
            end else
                if (CharCount = 0) then begin
                    ValidateWholeString := true;
                    break;
                end;
        until not Evaluate(ValidateInt, StoreChr);

        if (ValidateWholeString) and (CharCount = 0) then
            repeat
                StoreChr := CopyStr(String, StrLen(String) - CharCount, 1);

                If not Evaluate(ValidateInt, StoreChr) and (SwitchCondition = false) then begin
                    CharCount += 1;
                    VerifyStr := StoreChr + VerifyStr;

                end else
                    If Evaluate(ValidateInt, StoreChr) then begin
                        StoreChr := StoreChr + StoreStr;
                        StoreStr := StoreChr;
                        CharCount += 1;
                        SwitchCondition := true;
                    end else
                        break;

                if (StrLen(String) = CharCount) then
                    ExitLoop := true;
            until ExitLoop;

        if Evaluate(ValidateInt, StoreStr) then begin
            ValidateInt -= 1;
            if ValidateWholeString then
                StoreStr := Format(ValidateInt) + VerifyStr
            else
                StoreStr := Format(ValidateInt);

            ExitStr := CopyStr(String, 1, StrLen(String) - CharCount);
            exit(ExitStr + StoreStr);

        end else
            exit('');
    end;
}