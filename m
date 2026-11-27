Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792637;
	b=chpbyPrz1qhscryxxIO9iLdLx5rZI9yJ8iOnQY+NrudWCBkoQisQ9+mgc78tgGt8wxsD
	 w3p5Es7Wd0K5rDHHbyuYxB+gPvQFAtCUIduHq029a5EnNapnbJJWvdziVqA+xmL9EwU7M
	 bte2rWyy7kfLxguFtO/HFC2ybxkX5brMhb/7UJijgT8KBzAkhTXYXnPDenMzxHmsw/mvT
	 pHEsinIf9NPVU9A8RfKKnZT7wokhEmSibGOOmfkJ7Au2WdUsLC6KbolaftBzS1mOAVl/P
	 OU7fGPLSOtfeNaAWtuK4zjx0Und4J44rFZqHGc4UOGgbkx0FXMBm8jNfpK71XrKgnLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792637;
	h=Received:Delivered-To:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=cpWcJLY+0LUTX+QbjOK4UPOrUokKvPouxVcANaBn4Mo=;
	b=rTIJ3EmBl04XeL+U05s5Ujt9PY2FQ7xCkh0Rb700ss0WULxulvM75/FTlSYfUF2wWzo8
	 7pi2LocUyJe1cd8A9jIekUw6+rFaH4s29z1tH6VrcMNHk402kZUwillagmgjfCe9aiiL1
	 0OUwoVTGfmy3kCL/tbfbUJI+CxkZxaiGAymlKsr8BwiX53l2dJMuLftwkCYLhgTG5WOHp
	 +2FRrASyfoO6OP66CwAejf6Kc65q5ltRabatoD6sT3+CtrMQWsDwEvfPkc34w0xCvuzWm
	 3A8o6LAeCza0GOLpjMVwmNjPWDYgSfD5/6kbWa9vdPABvK0Atvpa3gBU1jjA0WO+2mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bG/G2sqj";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC856606A31C
	for <tools@linux.kernel.org>; Fri, 27 Nov 2026 15:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bG/G2sqj
Received: by smtp.kernel.org (Postfix)
	id B6B991F008A0; Fri, 27 Nov 2026 15:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE461F00893;
	Fri, 27 Nov 2026 15:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795792636;
	bh=cpWcJLY+0LUTX+QbjOK4UPOrUokKvPouxVcANaBn4Mo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bG/G2sqj4gGOQ4x6ga1bRlHKgeRalINUwkvoW74oHEwhfzzrGSpmwevYEQJIwsJdY
	 6sY9gNu33QPohBtoguqkn5pARwm5tc5IQF2X13MBZhkcyDcQxnAOmZujSCFs/5hCHF
	 nMTvvj6Y71tVFoFP0wVMSjsSIyw6Ta90rYI1cxgdCYb3reuJXV6uGnlQS7ne89vs5T
	 xx8Rli0BxtdoW7V2e/TadzlnqlDDWy6n9A3ST1qfLRzHtegfnHy/95dRJ5NGKihzk+
	 FNuyEanGDjmO0bOc/5xls1bYKS7XId44rqa5dfpm7UJcsm+t/PZMZqh0aVsdbXcUSd
	 iLHH7+A6qkl6Q==
From: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
Date: Fri, 27 Nov 2026 16:17:03 +0100
Subject: [PATCH b4 1/2] trailers: keep multi-line comments between
 Signed-off-by trailers
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-multiline-trailer-comments-v1-1-ae8360525615@kernel.org>
References: <20261127-multiline-trailer-comments-v1-0-ae8360525615@kernel.org>
In-Reply-To: <20261127-multiline-trailer-comments-v1-0-ae8360525615@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8539; i=matttbe@kernel.org;
 h=from:subject:message-id; bh=u1RzTAjBZSeA2I+FRoUpMmWsPeCgh+9zTFG/3Cf92gM=;
 b=owGbwMvMwCVWo/Th0Gd3rumMp9WSGLI55/08E/Ewc2PIp0XHahdw/lksJnXu7YRn2+6XG2xnW
 Np0b+IFsY5SFgYxLgZZMUUW6bbI/JnPq3hLvPwsYOawMoEMYeDiFICJ5KozMjx9/YB9Je+/Pwc6
 vRqkby2ecnLadwZ5fiaRR8lzYn4G7VFn+F+g8KJQxmCdsNbZgtXVp3QLCv1jxN4s2K+ZZZSmbPS
 QixsA
X-Developer-Key: i=matttbe@kernel.org; a=openpgp;
 fpr=E8CB85F76877057A6E27F77AF6B7824F4269A073

'b4 trailers -u' and 'b4 shazam' move multi-line [ ... ] comments placed
between two Signed-off-by trailers above all the trailers.

Such comments are commonly used to describe modifications made to a
patch after its original submission, and are placed between the
original author's Signed-off-by and the one of the person who modified
it. Moving them breaks this chain of custody description. Only
single-line comments were recognised so far.

The new tests check that:

- such a comment stays in place when follow-up trailers are added;
- trailer-like lines inside it are not parsed as trailers;
- unclosed brackets, blank lines, or comments not following a trailer
  are still treated as regular text.

Signed-off-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>
---
 src/b4/__init__.py                                 | 26 ++++++++++-
 ...lers-followup-custody-comment-ref-unordered.txt | 33 ++++++++++++++
 .../samples/trailers-followup-custody-comment.mbox | 45 +++++++++++++++++++
 src/tests/test___init__.py                         | 50 ++++++++++++++++++++++
 4 files changed, 152 insertions(+), 2 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 7dcf7b6..e3c0f33 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3401,10 +3401,11 @@ class LoreMessage:
         trailers: List[LoreTrailer] = list()
         others: List[str] = list()
         was_trailer = False
+        lines = [x.strip('\r') for x in body.split('\n')]
         at = 0
-        for line in body.split('\n'):
+        while at < len(lines):
+            line = lines[at]
             at += 1
-            line = line.strip('\r')
             matches = re.search(r'^\s*(\w\S+):\s+(\S.*)', line, flags=re.I)
             if matches:
                 oname, ovalue = list(matches.groups())
@@ -3469,6 +3470,27 @@ class LoreMessage:
                 trailers[-1].extinfo = line
                 was_trailer = False
                 continue
+            # Or a multi-line [ ... ] one, e.g. describing changes by the next signer
+            if was_trailer and re.search(r'^\s*\[[^]]*$', line):
+                end = at
+                while (
+                    end < len(lines)
+                    and lines[end].strip()
+                    and re.search(r'^[^][]*$', lines[end])
+                ):
+                    end += 1
+                if (
+                    end < len(lines)
+                    and lines[end].strip()
+                    and re.search(r'^[^][]*]\s*$', lines[end])
+                ):
+                    trailers[-1].extinfo = '\n'.join(lines[at - 1 : end + 1])
+                    logger.debug(
+                        'Multi-line extinfo %d-%d: %s', at, end + 1, trailers[-1]
+                    )
+                    at = end + 1
+                    was_trailer = False
+                    continue
             was_trailer = False
             others.append(line)
 
diff --git a/src/tests/samples/trailers-followup-custody-comment-ref-unordered.txt b/src/tests/samples/trailers-followup-custody-comment-ref-unordered.txt
new file mode 100644
index 0000000..4bbc1c3
--- /dev/null
+++ b/src/tests/samples/trailers-followup-custody-comment-ref-unordered.txt
@@ -0,0 +1,33 @@
+From git@z Thu Jan  1 00:00:00 1970
+Subject: [PATCH] Simple test
+From: Test Test <test@example.com>
+Date: Tue, 30 Aug 2022 11:19:07 -0400
+Message-Id: <orig-message@example.com>
+MIME-Version: 1.0
+Content-Type: text/plain; charset="utf-8"
+Content-Transfer-Encoding: 7bit
+
+Follow-up trailer collating test with a multi-line comment between
+two Signed-off-by trailers.
+
+Reviewed-by: Original Reviewer <original-reviewer@example.com>
+Signed-off-by: Original Submitter <original-submitter@example.com>
+[ Test Override: a comment describing the changes made after the
+  original submission, spanning: multiple lines. ]
+Reviewed-by: Followup Reviewer1 <followup-reviewer1@example.com>
+Signed-off-by: Test Override <test-override@example.com>
+
+diff --git a/b4/junk.py b/b4/junk.py
+index 12345678..23456789 100644
+--- a/b4/junk.py
++++ b/b4/junk.py
+@@@ -1,1 +1,1 @@ def junk():
+ 
+ 
+-junk1
++junk2
+ 
+ 
+-- 
+2.wong.fu
+
diff --git a/src/tests/samples/trailers-followup-custody-comment.mbox b/src/tests/samples/trailers-followup-custody-comment.mbox
new file mode 100644
index 0000000..8ce9458
--- /dev/null
+++ b/src/tests/samples/trailers-followup-custody-comment.mbox
@@ -0,0 +1,45 @@
+From foo@z Thu Jan  1 00:00:00 1970
+From: Test Test <test@example.com>
+Subject: [PATCH] Simple test
+To: Some List <list-1@lists.example.com>
+Date: Tue, 30 Aug 2022 11:19:07 -0400
+Message-Id: <orig-message@example.com>
+
+Follow-up trailer collating test with a multi-line comment between
+two Signed-off-by trailers.
+
+Reviewed-by: Original Reviewer <original-reviewer@example.com>
+Signed-off-by: Original Submitter <original-submitter@example.com>
+[ Test Override: a comment describing the changes made after the
+  original submission, spanning: multiple lines. ]
+Signed-off-by: Test Override <test-override@example.com>
+---
+
+diff --git a/b4/junk.py b/b4/junk.py
+index 12345678..23456789 100644
+--- a/b4/junk.py
++++ b/b4/junk.py
+@@@ -1,1 +1,1 @@ def junk():
+ 
+ 
+-junk1
++junk2
+ 
+ 
+-- 
+2.wong.fu
+
+From foo@z Thu Jan  1 00:00:00 1970
+From: Followup Reviewer1 <followup-reviewer1@example.com>
+Subject: Re: [PATCH] Simple test
+Date: Tue, 30 Aug 2022 11:19:07 -0400
+Message-Id: <fwup-message-1@example.com>
+In-Reply-To: <orig-message@example.com>
+References: <orig-message@example.com>
+
+> Follow-up trailer collating test with a multi-line comment between
+
+Reviewed-by: Followup Reviewer1 <followup-reviewer1@example.com>
+
+--
+My sig
diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index 60ef5b8..8f4242a 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -332,6 +332,55 @@ def test_fixes_trailer_format_validation(
     assert fixes == expected_fixes_values
 
 
+@pytest.mark.parametrize(
+    'body,expected_extinfo,expected_others',
+    [
+        # Multi-line comment between two trailers stays attached
+        (
+            'Signed-off-by: Foo Foo <foo@example.com>\n'
+            '[ Bar Bar: adapted the foo bits,\n'
+            '  Baz: and other: bits. ]\n'
+            'Signed-off-by: Bar Bar <bar@example.com>\n',
+            [
+                '[ Bar Bar: adapted the foo bits,\n  Baz: and other: bits. ]',
+                None,
+            ],
+            [''],
+        ),
+        # Unclosed bracket is not extinfo
+        (
+            'Signed-off-by: Foo Foo <foo@example.com>\n'
+            '[ this is not closed\n'
+            'Signed-off-by: Bar Bar <bar@example.com>\n',
+            [None, None],
+            ['[ this is not closed', ''],
+        ),
+        # A blank line ends the comment
+        (
+            'Signed-off-by: Foo Foo <foo@example.com>\n'
+            '[ this is not\n'
+            '\n'
+            '  closed here ]\n'
+            'Signed-off-by: Bar Bar <bar@example.com>\n',
+            [None, None],
+            ['[ this is not', '', '  closed here ]', ''],
+        ),
+        # Not following a trailer
+        (
+            '[ some\n  comment ]\nSigned-off-by: Bar Bar <bar@example.com>\n',
+            [None],
+            ['[ some', '  comment ]', ''],
+        ),
+    ],
+)
+def test_multiline_extinfo(
+    body: str, expected_extinfo: List[Optional[str]], expected_others: List[str]
+) -> None:
+    trailers, others = b4.LoreMessage.find_trailers(body)
+    assert [t.extinfo for t in trailers] == expected_extinfo
+    assert others == expected_others
+
+
 @pytest.mark.parametrize('wrap', ['\n', ' \n', ' \n    ', '\t\n\t'])
 def test_wrapped_fixes_trailer_matches_original(wrap: str) -> None:
     original = 'Fixes: 239b7c5705a4 ("vfio/pci: close display console during unrealize, not finalize")'
@@ -473,6 +522,7 @@ def test_trailer_addr_parsing(
             'with-ignored',
             {'trailers-ignore-from': 'followup-reviewer1@example.com'},
         ),
+        ('custody-comment', {}, {'addmysob': True}, 'unordered', {}),
         ('partial-reroll', {}, {'addmysob': True}, 'defaults', {}),
         ('nore', {}, {}, 'defaults', {}),
         ('non-git-patch', {}, {}, 'defaults', {}),

-- 
2.55.0

