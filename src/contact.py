from typing import Literal

def one_or_zero(item) -> Literal['0', '1']:
    '''Returns One or Zero depending on False or True'''
    return '1' if item else '0'

def contact_info(ALL=False, EMAIL=False, TEXT=False, DNC=False, MAIL=False, ROBOCALL=False, FAX=False, PHONE=False) -> int:
    '''Returns a binary representation for ALL, EMAIL, TEXT, DNC, MAIL, ROBOCALL, FAX, and PHONE'''
    if ALL:
        # Sets all of these to True automatically
        EMAIL=True
        TEXT=True
        MAIL=True
        ROBOCALL=True
        PHONE=True
    if EMAIL and TEXT and MAIL and ROBOCALL and PHONE:
        # Identifies that "All" has been default selected from this
        ALL=True
    
    # Create our binary representation
    txt = '0b'
    txt += one_or_zero(EMAIL)
    txt += one_or_zero(TEXT)
    txt += one_or_zero(DNC)
    txt += one_or_zero(MAIL)
    txt += one_or_zero(ROBOCALL)
    txt += one_or_zero(FAX)
    txt += one_or_zero(PHONE)

    # Return base 2
    return int(txt, base=2)


msg = contact_info(EMAIL=True, MAIL=True, TEXT=True, ROBOCALL=True, FAX=True, PHONE=True)
print(msg)
