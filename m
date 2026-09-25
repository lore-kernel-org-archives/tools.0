Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D357848640F
	for <tools@linux.kernel.org>; Fri, 25 Sep 2026 10:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790332229; cv=pass; b=eIMb6RwypvDQRdxmqJtLoA7DivyOfaZfsVd7Y/aw6FYSZsSgy8ybsvuchWzm3z8+GGiGni7rKVmkCVl+mJ8gtO6fjAZNgA4iLNUbvB/EBfzklSxb5lWZ47dQ352NsZtcv1j87RXkV/JMvcRIph6PQoiYTd12o4c0Zf1HMiRw7W4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790332229; c=relaxed/simple;
	bh=l+Bkvt5KJc9bAF8xmPcGTDUfPUsWRAALotF13R0ogXM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IRzyT4njUD4ri4fhfN74kN5VAbLp73cs7phoEGSxeiOfvzrYkSRGpI0qhW9+TAySib7tV7BxP3MleGKJqeq8Ie6uChfqDrcsbalHNQKHnPwdF5cB2J5LMPAECF7ZIl9toSPlWQ2hPMYxZHFkFcTEO73tNfKCkQlhOBgYrimks5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ejvFHVmr; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ejvFHVmr"
Received: by smtp.kernel.org (Postfix)
	id CE9F91F000FF; Fri, 25 Sep 2026 10:30:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.225.140
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790332227;
	b=DEknfkCq05AC9+XwqeZfVqDxmSI6vca2j573xpJyKXizYpmauwtFnZpjjjNVV79bCFk8
	 hxHNt7fzuwPUjmRRaagSSHmz9U3p37vi4TpwXX1CwawqisNjb0jyWXQSN26RkUw1BHvia
	 yaWETHB2N34YON8Yce5vGkuejSWgdAYdIWApW27ftafMM3tYP6bCxiIBr1NUE7r2FR0yU
	 NhZ+6wuRAjuzJ3d5z2gnZnl5YVISDZH2n2ftxKeqPf3PiK5SfANKjfT2nv1S705H5UXKo
	 /Ms1PwfCwgOw9DxJj61WAI4CQsWgrtGMQLFzsyvdcnzQJglPHACIr+76cRi3n+0J5eg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790332227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=G5BnqjRWjcSSc3v4vTl8lFpU2F93wVVEERtOMrFeXeg=;
	b=Baw7zFAXnzSzz2J2KIvvubatobsjxtKGd4dIx0YurPJRGl9sVvpm11HWu/WwSUfgiog5
	 tTQNy89pPA4qUKGxXPnbTCc6y9oRyAgqOmjIKUlRHZNgDcCJj0qXm37ZREHThZyj+7WKP
	 8/ncL6ApRCnyGYVB+pwoXJIYFBMKdpF7RE7t19LDhgmEX2iv0I9/n/zYrbGE1VaS1LuIe
	 TFyp1mPT9zKOD6QSQWjoZVeBivZ92oH7AGMXxhmhurxQBzS0jzYi3atBSmnfse8P4bthH
	 0B7wAL/i9p0F+yLIdoHEIprKJFAP8h9GOiOxaWjolQpxP/dEbN8kRGjv2rySnG0Qwzw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=74.125.225.140
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1C3451F00898
	for <tools@kernel.org>; Fri, 25 Sep 2026 10:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 1C3451F00898
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so4351475e9.2
        for <tools@kernel.org>; Fri, 25 Sep 2026 03:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790332215; x=1790937015; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G5BnqjRWjcSSc3v4vTl8lFpU2F93wVVEERtOMrFeXeg=;
        b=ejvFHVmrYs5XO0KvRO035E0kRk2hIzNDALvYwIN1Mo0/UbpRfcBQehBlcGu/7LK66o
         Gc6h+l4tomQmlt86axab26tHktY9OoFJevHIjWP99Kl6/voT2fXWX7bUPPbRcCxNUnsT
         6qH5cs1iSgw8xpRZZ9vdifZTWMM7u0ktnJczdPP+ld73kXGjtPngmpmE08OKC7FYiMTH
         Pa1B7nAqJYr5BTvmxBv/7e5v3M6Sd3wym2eUaMcRfr0yIM0ZqujIf258MF4aNRtL0MiF
         tMAAQ5FoZHAit7I/VRSqHW3IqeAltkWTKLJvuFuu1YunuIQRU+hZWC4llF4Vn4/kR8RW
         J2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790332215; x=1790937015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G5BnqjRWjcSSc3v4vTl8lFpU2F93wVVEERtOMrFeXeg=;
        b=sKBQbJzBMGf2sW701F6V5S9gYOLIO5pQ0/1CHwrbZIuJps9wQlcv5YjJIIUCknGCzS
         n1kqMS/dkB3hr6lBkvHt0WKBts1775RT8fJstGr305vkGhlTPNoILWcmnbJtsdCv+O5e
         u1mP/2zmRGt/4MJ/oxUcoeJsZGsNki8z9imNB3yQj5pOsioWrLRLbfZnFhDllbNQ2p0a
         PPixIIKJo7N/UIKEeeF3jgKJpSv9wmL23Wk81VnGcFXBQcBHyC69CsDI47JxZ/eqyI2L
         dxbzmB7rwVeuA6//FPD+OIwhIGL5OIaHfessmf3ToXoBOWi0nr1QbHO2Q4jQsNWaaeGX
         m7zA==
X-Gm-Message-State: AFuF++m95Yf29ie2MP1QeEyoAXcZ9eB/SdmrE0MWloSix+X6oX6zF3XF
	fgqeCglW8ZUUcN092hcVYWnz1udDpOCqMT2n9b2IwJuU4yvCRa4YTqe0vLpzNXv2MVKer5wdfJt
	tOOZ+
X-Gm-Gg: AYBFou2EW3J9C8tlxFnshZ4BUvVCgDOPWtSD5CzyeAnXUg4Ehqa779ts4Xn76RqhhYT
	yKO1/pJf3Ykn1soDyCpL9zORHuaTJ3HAb04RRopHQKGeLVWKiRRVvLb8BHj0Zvr7ERTYbKV/w3B
	LjEHP2saSqbQHZmNPgMVsSJqRJ/ousTHyEySwGY18jUzBniZ4zRzvPWXA/vnY/6D/TttZDO4fRJ
	4d7CfteQHVX+FN2W73LHEi1pdQ8tULEw1jifY4NSOq7r2l5nw3i2yfaegOPqHZmIWdG/LXYxL1G
	wgANJAOEkqZw6PdB2m3+wIzDXhFJ9VIKzB2m6cf9UgJ8GiTVdn9sQPjNMu1qh4o4lsBJlIOxQj4
	sWYdVlP8MBXonQedGPgVQwv4GhIg2NAwt3SSfdld0ie1AOtjRu0UwjlPXJpGGXzdqd2uy/d8/ID
	uHukWrN2YYigQ3+JLVQJwQ0hnp3TCiWu8s1QgajZYS/S08SprhJJ3nSFJnJTVh+4B9mhK8P+yUV
	jUXUXJEPEmfBNql8rjEh69AL+ie6Nw=
X-Received: by 2002:a05:600c:698c:b0:49f:df99:ff1a with SMTP id 5b1f17b1804b1-49ff06e503cmr28278715e9.17.1790332215346;
        Fri, 25 Sep 2026 03:30:15 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5df44f9sm129443535e9.11.2026.09.25.03.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 03:30:14 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 25 Sep 2026 12:30:12 +0200
Subject: [PATCH kgl 2/2] Fold the M:, R: and L: branches into one table
 lookup
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260925-fix-list-comment-v1-2-0c4c9599d3e4@baylibre.com>
References: <20260925-fix-list-comment-v1-0-0c4c9599d3e4@baylibre.com>
In-Reply-To: <20260925-fix-list-comment-v1-0-0c4c9599d3e4@baylibre.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

The three fields are parsed the same way -- extract_email() on the value,
append what it returns -- and since the previous commit they are three
copies of the same four lines. Three copies of one idea is how they
drift.

Map each prefix to the list it fills and take the branch once. While
here, say so when a line cannot be parsed: a maintainer or list line
parseaddr rejects, such as two addresses on one line, was dropped without
a word, and the only later symptom is an entry with no maintainers or a
"No mailing lists found" warning that does not say why.

Assisted-by: LLM [analysis, codegen, tests]
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 CHANGELOG                    |  3 +++
 src/korgalore/maintainers.py | 23 +++++++++++++----------
 tests/test_maintainers.py    | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+), 10 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index fe96273605eb..5766f2d2e4e7 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -7,6 +7,9 @@ v0.7 (unreleased)
 Enhancements
 ~~~~~~~~~~~~
 
+* An ``M:``, ``R:`` or ``L:`` line in MAINTAINERS that cannot be parsed is
+  now reported in the log instead of being skipped silently
+
 * GUI: Add "About" dialog showing version, description, website, and license
 
 * HTTP failover and auto-probe for all lore.kernel.org requests
diff --git a/src/korgalore/maintainers.py b/src/korgalore/maintainers.py
index 69d3e2e09a73..bd84ea3a814f 100644
--- a/src/korgalore/maintainers.py
+++ b/src/korgalore/maintainers.py
@@ -24,6 +24,14 @@ REGEX_METACHARACTERS = r'\[](){}|^$?+*'
 # Recognized SCM types for T: lines, per the MAINTAINERS file format.
 KNOWN_VCS_TYPES = {'git', 'hg', 'quilt', 'stgit', 'topgit'}
 
+# Fields whose value is an address, wrapped in a display name (M:, R:) or
+# followed by a comment (L:), mapped to the SubsystemEntry list it fills.
+EMAIL_FIELDS: Dict[str, str] = {
+    'M': 'maintainers',
+    'R': 'reviewers',
+    'L': 'mailing_lists',
+}
+
 
 @dataclass
 class Tree:
@@ -186,18 +194,13 @@ def parse_maintainers(path: Path) -> Dict[str, SubsystemEntry]:
                     prefix = line[0]
                     value = line[3:].strip()
 
-                    if prefix == 'M':
+                    if prefix in EMAIL_FIELDS:
                         email = extract_email(value)
                         if email:
-                            current_entry.maintainers.append(email)
-                    elif prefix == 'R':
-                        email = extract_email(value)
-                        if email:
-                            current_entry.reviewers.append(email)
-                    elif prefix == 'L':
-                        email = extract_email(value)
-                        if email:
-                            current_entry.mailing_lists.append(email)
+                            emails: List[str] = getattr(current_entry, EMAIL_FIELDS[prefix])
+                            emails.append(email)
+                        else:
+                            logger.warning('Ignoring unparsable %s: line in %s: %s', prefix, current_entry.name, value)
                     elif prefix == 'F':
                         current_entry.files.append(value)
                     elif prefix == 'X':
diff --git a/tests/test_maintainers.py b/tests/test_maintainers.py
index 8926009be90c..d33cd2d4f10d 100644
--- a/tests/test_maintainers.py
+++ b/tests/test_maintainers.py
@@ -1,5 +1,6 @@
 """Tests for MAINTAINERS file parser and query builders."""
 
+import logging
 from pathlib import Path
 
 import pytest
@@ -585,6 +586,38 @@ F:\tarch/arm/mach-*/
         query, _ = build_mailinglist_query(entry, '30.days.ago')
         assert query == '(l:linux-arm-kernel.lists.infradead.org OR l:pvrusb2.isely.net) AND d:30.days.ago..'
 
+    def test_parse_unparsable_list_is_dropped(self, tmp_path: Path, caplog: pytest.LogCaptureFixture) -> None:
+        """An L: line with no usable address is dropped, with a warning saying so."""
+        maintainers = tmp_path / 'MAINTAINERS'
+        maintainers.write_text("""
+BROKEN ENTRY
+M:\tSome One <someone@example.com>
+L:\tfoo@lists.example.org (moderated for non-subscribers
+L:\tbar@lists.example.org
+S:\tMaintained
+F:\tdrivers/broken/
+""")
+        with caplog.at_level(logging.WARNING, logger='korgalore'):
+            entry = parse_maintainers(maintainers)['BROKEN ENTRY']
+        assert entry.mailing_lists == ['bar@lists.example.org']
+        assert 'Ignoring unparsable L: line in BROKEN ENTRY' in caplog.text
+
+    def test_parse_unparsable_maintainer_warns(self, tmp_path: Path, caplog: pytest.LogCaptureFixture) -> None:
+        """M: and R: lines get the same treatment as L: when they cannot be parsed."""
+        maintainers = tmp_path / 'MAINTAINERS'
+        maintainers.write_text("""
+BROKEN ENTRY
+M:\tone@example.com, two@example.com
+R:\tReviewer <reviewer@example.com>
+S:\tMaintained
+F:\tdrivers/broken/
+""")
+        with caplog.at_level(logging.WARNING, logger='korgalore'):
+            entry = parse_maintainers(maintainers)['BROKEN ENTRY']
+        assert entry.maintainers == []
+        assert entry.reviewers == ['reviewer@example.com']
+        assert 'Ignoring unparsable M: line in BROKEN ENTRY' in caplog.text
+
     def test_parse_multiple_subsystems(self, tmp_path: Path) -> None:
         """Parse multiple subsystem entries."""
         maintainers = tmp_path / 'MAINTAINERS'

-- 
2.55.0

