Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E986F33B6DA
	for <tools@linux.kernel.org>; Fri, 25 Sep 2026 10:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790332224; cv=pass; b=JY/mKO2NUUFTtbnmIx1fI+HsrTpY0OjO8IKc8QfOUSpON4R2odb4mket59J4eH9NR0BTgdGEO4uKAxu2krSXGGXE+jYk/npCDvC11Pc9Z1ij0Yw4ZckWG5p+qDMoktyyLbpU6IbIT3hmSBpaKV0Xq+vZGRgErznBpv+CKb1AIyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790332224; c=relaxed/simple;
	bh=T6yTTVzLq31pW3DeBUPa309cReovHqR/imOl4uMEXv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kPTavWfCdXoOuN8JKArz5MOQSrmZKWUAMl9H6hIUkV7pie2CWVgE/NW9m4E/zeRzpU6lOKmDQFhyxTOPv4QW7JL8xA6zxY8yFQB+Qbo+giB9CVIUX8sCcQ7+qxJdW1hnlhMvhbPUhqjmjSq8YoMN+/zxAmbO0znPfC2bnpwALoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=OuBmzTFu; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="OuBmzTFu"
Received: by smtp.kernel.org (Postfix)
	id D6B901F00899; Fri, 25 Sep 2026 10:30:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.225.99
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790332222;
	b=i3yobQ245Lrzz6jfIbjsMsK3EIHVErjd8puuH2lEAQI2e2qF3m3ZOzLXArf3kpboBQaQ
	 ZxwmE8uI6xX3AQ3qlK7WUmA95s2mdpej8qcpn4v6N6T5vt7MGv5rxIJlAKcMFhn2hTjYO
	 QR0848mlrQNAOpcJ9CXL3M3HzjHA5Ss5NAxFxi+HGve6MjD4o2zQxPZKFaVP1dCUQMRuc
	 p9eLt0UR752CfphA5u9IFxjI8EaO89Fg1HbWmayjCojVNARy7glU1zSrZWkarG8uKgrJO
	 G9XlwWMINb8FKzjfygFDvHS66XCUsRY1Pnj72b96qjxCMhkex9GcWOtn4F4jdm4aMvg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790332222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Zafh/GlxwstjDLr2m3UhXUMwRxhZSLjuz2xeGEICu4U=;
	b=fW9u4rtYNMbAy6Y9WrlTwgaPTq8irBMTwGI48a/avxxCcYDjB1t64ADvY51DMzNRpvdR
	 gWRTMt9fziuykQEvpLop3rpYu1HtLZfyyxwsd0doxARD8BiCKmS7aA3mew7NQnYGiQCMC
	 czKmztIbJ79XxneMI/Ub/cl1jZNdHsZkwfK4PERcMFjWVLEcz6KHGVuadqtjEQhns79ZD
	 sJ34+Nk4q7mGIWkqt11gYpQ5Brjia7ekYahOsFZZ0UN8NUh3U3Yhe+Q0JTlOlUsvFbVtQ
	 rOeX82AXjSRu1oO5ebjAhFYI0wYaZG7RW8RgPMitfqKGE6OVP/SKlbLpy+ZDO3dQ/NA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=OuBmzTFu;
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=74.125.225.99
Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 52A191F000FF
	for <tools@kernel.org>; Fri, 25 Sep 2026 10:30:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=OuBmzTFu
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 52A191F000FF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4888129c46eso195063f8f.1
        for <tools@kernel.org>; Fri, 25 Sep 2026 03:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790332215; x=1790937015; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zafh/GlxwstjDLr2m3UhXUMwRxhZSLjuz2xeGEICu4U=;
        b=OuBmzTFuY/H/JZlSnSvaA1Jt84MZitGU2lxyv8gvA2D6c48kccYmqkYCraGQNJW1rO
         sTlS6DL9awrI0WE6XOl160cKUO2pLpLpmtXO/JIhfcLfg9z8epJw7gITJ15xnKvk5Yc+
         RSHirLXRzR7mNDWQIUkgNT6NsvVeiLwgYb7bamgNUzuodN8x3qFgX78mx9KHHpxMaT3g
         7zXdBQcJ1BERmWuESsvyavZ8k8qQg1wJMGy427QXHyGXIvdT+jABj38RxP8baQBOdAFd
         /QO8QZQTg6Xhs8looxFYj3/rmd7kvzmixw0FU5YH/zeOLSyola4Zrk4NNDAUbFH7bO/J
         /0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790332215; x=1790937015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zafh/GlxwstjDLr2m3UhXUMwRxhZSLjuz2xeGEICu4U=;
        b=EmapmL5t+puKOUksJgac7r1VpKL793t/cCvl+oJ0Oavc36XPSXZyIpwaGF78LtyTOs
         dUUOBhy8Ezxc8pARrUMv1lOog1yVlhke0G9evNbSxvTrceMhAMQoUyBvtJ2NUbBIIBic
         yTuJpRJVMfVDn/ooFwpsC95Amg14NO+c6QxgewGjvZDrONjdB7GF8T6bsD5EV6p2cAHy
         rOeimm7L58GSq4PjDeeykSb8H21Qr6dh4aaL8n8IpPWxMQ6Lcb1nC9fjNM01HnE+mlGR
         K7hU4mjtwXXkquTzKg30+qBni8FOm/J/Z5ta4p8pOsxQA5mhqwcySzL116B3Mq1YLZSh
         4KUw==
X-Gm-Message-State: AFuF++mCMWgWgBSmQuwh3DxYr8crYOth1JISv+QIqVD75vYJljv/RWT5
	tEZU28v+o+7zdH5Lwtt7wFQgBGeGhHLx1pMRPU/xwx0M7WD06vq5gN9FNcQW/pnmLfw=
X-Gm-Gg: AYBFou2SAYNMt/3yG9f932qUlkLYUZRph2nIhaDKAMsIbrnJTQ60Ipf+esgktGCD8Uc
	LbMgd8teiZ41hQtN0dkrBUFMcHjnpE791VUhYv3pRoJnDzJYTdR/zJZcToca1NcRiUBZVHZcJZB
	Rg6myGslEzEbMMqGipxlo5O3taLpgs8kXPq7lRSxD5G/RBkzfBVLwAONPC2HRM9ven3OQOuGTYz
	g3f2M06lnaix9dRxj3bmgNm6CqGgdN32gRdNFckvnsfNHSuO5Tu4pUXsqIzXQCZ3LO1895+UAm0
	4FQ8QiibbZFgbPsqX8vNKL43oZnkQ8bJ/Uk1eAbKxWbh7groug9Ct7o1Vauops8Ulo6+4U2gJO1
	BrMvLpdJFMjcal/DX2ZyK6eU0/t1n6IMWce9iI4AAgo8hmZQTpxiSUTGgZjAsSuuhHDSpp1zhb7
	D+bOpieUjNMEYz5KSkPD0KvdO8gV9nwmfipTAZruwbTyhX4QLK7mlvSXeCFUcRt1+5PVDZfRJpw
	n2Xv5zTpj044N+Vw7un
X-Received: by 2002:a05:600d:8643:10b0:49f:bb8a:b4ce with SMTP id 5b1f17b1804b1-49fe67bc26fmr66150825e9.28.1790332214514;
        Fri, 25 Sep 2026 03:30:14 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff065873csm49117815e9.2.2026.09.25.03.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 03:30:14 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 25 Sep 2026 12:30:11 +0200
Subject: [PATCH kgl 1/2] Drop the comment from a MAINTAINERS L: line before
 querying lei
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260925-fix-list-comment-v1-1-0c4c9599d3e4@baylibre.com>
References: <20260925-fix-list-comment-v1-0-0c4c9599d3e4@baylibre.com>
In-Reply-To: <20260925-fix-list-comment-v1-0-0c4c9599d3e4@baylibre.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

An L: line may carry a comment after the address, and most infradead
lists do:
'linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)'
The value was stored as written and turned into a lei term by replacing the `@',
so the query became:

    l:linux-arm-kernel.lists.infradead.org (moderated for non-subscribers)

which asks for messages on the list that also contain those words.

Parse L: through extract_email() the way M: and R: already are.
parseaddr treats the parenthesised text as an RFC 822 comment and returns the
bare address for every form the current MAINTAINERS uses.

Assisted-by: LLM [analysis, codegen, tests]
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 CHANGELOG                    |  7 +++++++
 src/korgalore/maintainers.py |  7 +++++--
 tests/test_maintainers.py    | 23 +++++++++++++++++++++++
 3 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/CHANGELOG b/CHANGELOG
index 859a70684c99..fe96273605eb 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -99,6 +99,13 @@ Refactoring
 Bug Fixes
 ~~~~~~~~~
 
+* A comment on a MAINTAINERS ``L:`` line, such as ``(moderated for
+  non-subscribers)``, is no longer passed to lei as search terms. Every
+  list carrying one was reduced to the few threads that happened to
+  contain those words instead of the whole list. ``main.catchall_lists``
+  is now matched against the bare address too, so an entry written with
+  the comment no longer matches.
+
 * A Message-ID with a trailing comment no longer defeats duplicate
   detection
 
diff --git a/src/korgalore/maintainers.py b/src/korgalore/maintainers.py
index 28b9eca3c6cb..69d3e2e09a73 100644
--- a/src/korgalore/maintainers.py
+++ b/src/korgalore/maintainers.py
@@ -97,12 +97,13 @@ def normalize_subsystem_name(name: str) -> str:
 
 
 def extract_email(line: str) -> Optional[str]:
-    """Extract email address from a maintainer/reviewer line.
+    """Extract email address from a maintainer, reviewer or list line.
 
     Handles formats like:
         'Full Name <email@domain.com>'
         '"Full Name" <email@domain.com>'
         'email@domain.com'
+        'list@domain.org (moderated for non-subscribers)'
     """
     _, email = parseaddr(line)
     return email if email else None
@@ -194,7 +195,9 @@ def parse_maintainers(path: Path) -> Dict[str, SubsystemEntry]:
                         if email:
                             current_entry.reviewers.append(email)
                     elif prefix == 'L':
-                        current_entry.mailing_lists.append(value)
+                        email = extract_email(value)
+                        if email:
+                            current_entry.mailing_lists.append(email)
                     elif prefix == 'F':
                         current_entry.files.append(value)
                     elif prefix == 'X':
diff --git a/tests/test_maintainers.py b/tests/test_maintainers.py
index 217cb1b3fbd7..8926009be90c 100644
--- a/tests/test_maintainers.py
+++ b/tests/test_maintainers.py
@@ -63,6 +63,10 @@ class TestExtractEmail:
         """Extracts email when name is quoted."""
         assert extract_email('"John Doe" <john@example.com>') == 'john@example.com'
 
+    def test_list_with_comment(self) -> None:
+        """Drops the comment MAINTAINERS puts after a list address."""
+        assert extract_email('list@domain.org (moderated for non-subscribers)') == 'list@domain.org'
+
     def test_bare_email(self) -> None:
         """Handles bare email addresses without angle brackets."""
         assert extract_email('john@example.com') == 'john@example.com'
@@ -562,6 +566,25 @@ F:\tnet/9p/
         assert 'fs/9p/' in entry.files
         assert 'net/9p/' in entry.files
 
+    def test_parse_list_with_comment(self, tmp_path: Path) -> None:
+        """A comment after an L: address is dropped, not searched for."""
+        maintainers = tmp_path / 'MAINTAINERS'
+        maintainers.write_text("""
+ARM SUB-ARCHITECTURES
+M:\tArnd Bergmann <arnd@arndb.de>
+L:\tlinux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:\tpvrusb2@isely.net\t(subscribers-only)
+S:\tMaintained
+F:\tarch/arm/mach-*/
+""")
+        entry = parse_maintainers(maintainers)['ARM SUB-ARCHITECTURES']
+        assert entry.mailing_lists == [
+            'linux-arm-kernel@lists.infradead.org',
+            'pvrusb2@isely.net',
+        ]
+        query, _ = build_mailinglist_query(entry, '30.days.ago')
+        assert query == '(l:linux-arm-kernel.lists.infradead.org OR l:pvrusb2.isely.net) AND d:30.days.ago..'
+
     def test_parse_multiple_subsystems(self, tmp_path: Path) -> None:
         """Parse multiple subsystem entries."""
         maintainers = tmp_path / 'MAINTAINERS'

-- 
2.55.0

