Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C20249AA20
	for <tools@linux.kernel.org>; Sun, 18 Oct 2026 13:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792329470; cv=pass; b=VScqyihdNXhUO31wj5RSP96vfaajB6U62MSnkR5gq8Nb6Deu3Q7TPOHohapVVnW4Tmn2bayYXaFVzvu0cAfwO97pzxDRdGfwKu+EByZ1ufMTI3mrL/d3N+DCyATYXRJ7TXBmk9fOKioRae4HG360b5qeWD/F/qyOSZLNqitvBUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792329470; c=relaxed/simple;
	bh=HwaBABtc9dQTYd0CKjAc00b8cQ30hiSeQsyFpZCNJyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=J39iHBNyG/Vh+8dvwLhVD3bF+g0fcecW9beeUAEu5OKQKmEiA7rdsJg2oe1rYS/5txkGV9OcxS/icUs7Ltbt//ji74sTRNQPZLNh91ejbc+Rb/f5VGcnCXAiQccHcwLUNUlwDjA9m47NyZgvisnSCZUKC1ouuMH1ydL6vLTvus0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=laumann.xyz header.i=@laumann.xyz header.b=15vMCLXq; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=laumann.xyz header.i=@laumann.xyz header.b="15vMCLXq"
Received: by smtp.kernel.org (Postfix)
	id 92FD81F000C5; Sun, 18 Oct 2026 13:17:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=91.218.175.41
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792329466;
	b=dQime2MuTc3n9UfuyszWNthTNrI9BNFTnCb5hGFfGyO22ZlNUlVfdQNaOXct83vd/dj9
	 1gXpog/6xr5iEeKwMNLXHgLPL28C4gjDi750BSco/Z20hkqTnqS4RnkAHoAGt/MZ7UQrY
	 aY+WqTRV2aj9BG+VhuocEDozoc3eLTiPaBRZSh0aEx9nF0OQ8zbghQ1hnwVWCr5dMIjSY
	 ze4Qd8IaADvMw2ihmVQwDSUlamnPa6W9LrAQE99WfVQgTch0/ll0F1eDqgzZQsdfXkXYO
	 jm95DVcWVyAZZUiwBpPzJXlQGFx0lslswAM02K7e7M8K+10Ufh3LDOpOTWKkg3I7DzA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792329466;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=q2WRNlzJnsz/EhBUStocbC/lINPAvP/LiRmRxC8+nnA=;
	b=Hj8z1gBYmS1LP/RFH7QhK0ZH9OfsLosVH6Ux1BQQvTiS1bDBQna2R0S0692ZoGWNQGps
	 Gjnk0xsnKqLxgblaGhqRDLVy26VGrqXSAas7VyRG4slc3X9hnTVLjddL+qv6NqJbnDIJW
	 5qJgB/ewGEcyl46+l28pkYfyYpr62LsVYnHOUz7szBVIyzag7a03rcDhcvupXB3FtGnRW
	 H9BUoye/sB5APTdbL32XtTYf37ouQURbr2P7JmyQwGdRkBzHOW5J8lT5RlVUMLvDMKGUp
	 auUY0509eGT7vdHuk1Hk3/tz7r+sWAMdxi4mpeqTeoYHEvVsMrgKBDoHJdQt8Icvm7A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=laumann.xyz header.i=@laumann.xyz header.a=rsa-sha256 header.s=key1 header.b=15vMCLXq;
	dmarc=pass header.from=laumann.xyz;
	spf=pass smtp.mailfrom=laumann.xyz;
	arc=none smtp.remote-ip=91.218.175.41
Received: from mta0.migadu.com (out-41.mta0.migadu.com [91.218.175.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 11EAA1F000C4
	for <tools@kernel.org>; Sun, 18 Oct 2026 13:17:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=laumann.xyz header.i=@laumann.xyz header.a=rsa-sha256 header.s=key1 header.b=15vMCLXq
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 11EAA1F000C4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=laumann.xyz
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=laumann.xyz
X-Envelope-To: tools@kernel.org
DKIM-Signature: a=rsa-sha256; bh=HwaBABtc9dQTYd0CKjAc00b8cQ30hiSeQsyFpZCNJyQ=;
 c=simple/simple; d=laumann.xyz;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792329461; v=1; x=1792934261;
 b=15vMCLXqOFuiqcD/axfkPylEUsoDUitK5OubSA/3+f2CD7bQwsn/4HmRNpjJDq2SQjIDam/l
 1Z1lwoV15ch0eGNTTEpkzQHqAcNYYAVir9s0WtKIV+rcha+wZXwJ6UOFX9afDXYThXW+MgsOy6i
 JRVauvZcH0p82Jrhx2JiAYlxeX8E6NdI4f4lco99dZQHGT7g1wWOQ7o8hncUCDTmjhzuOVzY5iv
 jGwyDDWPGGnBPXlxpsd7I+icBOL/AWR7d25oHLguv/vsXU2jzhI1mtiB65l2IP2+G9TFWj2I0D+
 P89SQQQYS3tvkoyZbDTwIKZhpPaESCqJf+4NacaGDrPBg==
X-Envelope-To: tools@kernel.org
Received: by smtp.migadu.com with ESMTPS id 314e62c08429cbbe;
	Sun, 18 Oct 2026 13:17:41 +0000
X-Mizu-Trace-ID: 314e62c08429cbbe
X-Migadu-Flow: FLOW_OUT
From: Thomas Bracht Laumann Jespersen <t@laumann.xyz>
Date: Sun, 18 Oct 2026 15:17:32 +0200
Subject: [PATCH b4] LoreSubject: match whole string for prefixes
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-send-lore-subject-extra-prefixes-v1-1-48955111e886@laumann.xyz>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zWM0QrCMBAEf6XcswdJrdL6K9KHJF31RFK5q1Io/
 XdT1MfZZWYhgwqMTtVCireYjLmA31WUbiFfwTIUptrVR+98y4Y88GNUsL3iHWlizJMGfiouMsP
 4EGIM2KfOdS2VzP8olTPFhvrv9rO3Nq3rB+zt1N2IAAAA
X-Change-ID: 20261018-send-lore-subject-extra-prefixes-5abbae3c9098
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Thomas Bracht Laumann Jespersen <t@laumann.xyz>
X-Mailer: b4 0.16.0

When collecting extra prefixes in LoreSubject.get_extra_prefixes(),
have the regexes require a full match for something like "v2" or
"1/2" instead of just looking for a matching substring. This prevents
matching something like "dev2forge".

Signed-off-by: Thomas Bracht Laumann Jespersen <t@laumann.xyz>
---
I observed that for a project using format.subjectPrefix = "PATCH
proj/dev2forge" the extra prefix was dropped when generating a patch
during "b4 send". I worked around the issue with "b4 prep
--set-prefixes" but wanted to know why the prefix was being dropped.

The regexes used to match prefixes in LoreSubject.get_extra_prefixes()
do not require a full match so "proj/dev2forge" is matched by r"v\d+"
as it contains the substring "v2".
---
 src/b4/__init__.py         | 4 ++--
 src/tests/test___init__.py | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index eb04a2a..d817e47 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3855,9 +3855,9 @@ class LoreSubject:
         for _prf in self.prefixes:
             if _exclude and _prf.lower() in _exclude:
                 continue
-            if re.search(r'v\d+', _prf, flags=re.I):
+            if re.search(r'^v\d+$', _prf, flags=re.I):
                 continue
-            if re.search(r'\d+/\d+', _prf):
+            if re.search(r'^\d+/\d+$', _prf):
                 continue
             ret.append(_prf)
 
diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index 764829d..a7e04da 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -1244,6 +1244,11 @@ class TestTakeFlow:
             ['netdev', 'bpf'],
             '[PATCH RFC netdev bpf v3 2/3] This is a patch',
         ),
+        (
+            '[PATCH proj/dev2forge] This is a patch',
+            None,
+            '[PATCH proj/dev2forge] This is a patch',
+        ),
     ],
 )
 def test_lore_subject_prefixes(

---
base-commit: 6be7c6139d7734d84afddf989fa2874935b6d85b
change-id: 20261018-send-lore-subject-extra-prefixes-5abbae3c9098

Best regards,
--  
Thomas Bracht Laumann Jespersen <t@laumann.xyz>

