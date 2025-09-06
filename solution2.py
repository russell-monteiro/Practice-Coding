# solution2.py
# ==============================================
# Lab Assignment 4 - String Manipulation (Q10–Q11)
# ==============================================

# Q10: Palindrome Rearrangement Checker
def palindrome_checker(s):
    """
    Check if the given string can be rearranged into a palindrome.
    
    Rules:
    - A string can be rearranged into a palindrome if
      at most ONE character has an odd frequency.
    - Example:
        "civic" -> Yes
        "ivicc" -> Yes (can rearrange to civic)
        "hello" -> No
    - Empty string or non-string input -> "input invalid"
    """

     # invalid input
    if type(s) != str or s == "":
        return "input invalid"

    # make a frequency dictionary
    freq = {}
    for ch in s:
        if ch not in freq:
            freq[ch] = 1
        else:
            freq[ch] = freq[ch] + 1

    # check how many characters have odd frequency
    odd_count = 0
    for ch in freq:
        if freq[ch] % 2 != 0:
            odd_count = odd_count + 1

    # rule: at most one odd allowed
    if odd_count <= 1:
        return "Yes"
    else:
        return "No"


# Q11: String Rotation Validator
def rotation_checker(s1, s2):
    """
    Check if s2 is a rotation of s1.
    
    Rules:
    - "abcd" rotated -> "bcda", "cdab", "dabc"
    - To check: s2 must be substring of (s1+s1).
    - Invalid if inputs are not strings OR lengths differ.
    """
    if not isinstance(s1, str) or not isinstance(s2, str):
        return "input invalid"

    if len(s1) != len(s2):
        return "input invalid"

    # Trick: rotation check
    return s2 in (s1 + s1)


# ---------- Testing ----------
if __name__ == "__main__":
    # Q10 tests
    print("Q10 Tests:")
    print(palindrome_checker("civic"))   # Yes
    print(palindrome_checker("ivicc"))   # Yes
    print(palindrome_checker("hello"))   # No
    print(palindrome_checker(""))        # input invalid
    print(palindrome_checker(123))       # input invalid

    # Q11 tests
    print("\nQ11 Tests:")
    print(rotation_checker("abcd", "bcda"))   # True
    print(rotation_checker("abcd", "dabc"))   # True
    print(rotation_checker("abcd", "acbd"))   # False
    print(rotation_checker("abc", "ab"))      # input invalid
    print(rotation_checker("abc", 123))       # input invalid
