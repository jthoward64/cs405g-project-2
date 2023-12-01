from typing import Literal, TypedDict


def one_or_zero(item) -> Literal["0", "1"]:
    """Returns One or Zero depending on False or True"""
    return "1" if item else "0"


TEXT_BITMASK = 0b00000001
EMAIL_BITMASK = 0b00000010
MAIL_BITMASK = 0b00000100
ROBOCALL_BITMASK = 0b00001000
FAX_BITMASK = 0b00010000
PHONE_BITMASK = 0b00100000
DNC_BITMASK = 0b01000000
ALL_BITMASK = (
    TEXT_BITMASK | EMAIL_BITMASK | MAIL_BITMASK | ROBOCALL_BITMASK | PHONE_BITMASK
)


def contact_info(
    ALL=False,
    EMAIL=False,
    TEXT=False,
    DNC=False,
    MAIL=False,
    ROBOCALL=False,
    FAX=False,
    PHONE=False,
) -> int:
    """Returns a binary representation for ALL, EMAIL, TEXT, DNC, MAIL, ROBOCALL, FAX, and PHONE"""
    bitmask = 0b00000000

    if ALL:
        bitmask |= ALL_BITMASK
    else:
        if EMAIL:
            bitmask |= EMAIL_BITMASK
        if TEXT:
            bitmask |= TEXT_BITMASK
        if MAIL:
            bitmask |= MAIL_BITMASK
        if ROBOCALL:
            bitmask |= ROBOCALL_BITMASK
        if PHONE:
            bitmask |= PHONE_BITMASK
    if DNC:
        bitmask |= DNC_BITMASK
    if FAX:
        bitmask |= FAX_BITMASK

    return bitmask


class ContactInfo(TypedDict):
    text: bool
    email: bool
    mail: bool
    robocall: bool
    phone: bool
    all: bool
    fax: bool
    dnc: bool


def get_contact_info(contact_info_bits: int) -> ContactInfo:
    """Returns a dictionary of contact info"""
    return {
        "text": bool(contact_info_bits & TEXT_BITMASK),
        "email": bool(contact_info_bits & EMAIL_BITMASK),
        "mail": bool(contact_info_bits & MAIL_BITMASK),
        "robocall": bool(contact_info_bits & ROBOCALL_BITMASK),
        "phone": bool(contact_info_bits & PHONE_BITMASK),
        "all": bool(contact_info_bits & ALL_BITMASK),
        "fax": bool(contact_info_bits & FAX_BITMASK),
        "dnc": bool(contact_info_bits & DNC_BITMASK),
    }
