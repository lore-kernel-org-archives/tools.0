Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC42BA3D
	for <tools@linux.kernel.org>; Sun, 31 May 2026 17:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780250385; cv=pass; b=W5wsgbPYHYfyea0kKRU9AAZBzD1ZaXrrM+sIkbTBz6D1Qwhx47hfhopPZ4rMXHyLqirB/GCQJ6KZA8U/5Th3IYYTMHpmlUXz9rYiJ5fo29mhicoKlqgLUI49pHF9HaaFiuVkozX0cXMoXbWGFT2bI4ELiP3mDAO+42zrTjTi+5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780250385; c=relaxed/simple;
	bh=UoLupISDDRYAdCCnAHPCnYDTKcxyPeLll01dssEweE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=o3LI4XjTG911T7LfCF4mL7c5sHB0n7Z60twFLLz0DhgduuQGlRiRxGjlS7NmohdGFfmGpsR5bkXy5kyCgBV38SPKg13Jrrs+Sn1p4yTt2QidblruvZ5G6HJjdoLzWmI86eC/F0CW7uhXAbDsmUAT5KObcV+fAvClMS0pvgxGPEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SuueWSL4; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SuueWSL4"
Received: by smtp.kernel.org (Postfix)
	id D72371F00898; Sun, 31 May 2026 17:59:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780250383;
	b=AmQfK/h7dy38DydSCDkgDsVy+Sich5zHe4eClyL1bU2dof0SACHiQu3paOGvs39adjxJ
	 AmhbT+f7HOM4G3SHtquKTMnfmZ+3CjsqPmDMi6ig0NWYA5eI8liBfEh++oFloNVTjXjA3
	 kQrZNcK5jyVnzuWcA4NWK/WvI/4yHwEnkZq4QSX9LG/g7gmOk9N2PqY+GtUFZitzzAbMg
	 MWhYo1bPsPR5bG36TCc+IbN8vXDgGwAb/FcHh2r7pfipyS60mwmBER2vJ2xxum9wFkIUv
	 iMrUBSHobpRNgS5wGfyUu20cfcJGv12BiE7Ox8ofDe1rt2rtR71ckHFuLR2RU75aZrQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780250383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=NtjgIDullXyIPa5oKp5eEqk537C8gpe3ilMzVxuUb5M=;
	b=t5aHEXNEWvwk8QaOaG6SgrDxt3qK2YmqbMfLyDcjQX/l6wNdY1U5I3O2+8ptOuyy7BSX
	 981yWGYJz5jhrj9EcjI0JciwTNnVtLTYwIdZuDzbyMxZJEFFB/dNmuq9MKnoMqEArjX3b
	 dzYDhfnD0G8k7PMQdKxlZWz5krJWLwqfKibiuSduS+2+dFNux2iwISG4uSkD40EZ48VKa
	 7GdTwKU8fyMBziqU7u5venIl1T6oP3o4jFej/Vva2HQG2XFOwdkw49hY8Wd6U5GhlDz8s
	 Q7C2Y6foAzSB8V65ajOdKvJG9YQ2ZdKbakl3p1wrHMZX0LVMfltmv1nrpzCRHGxfqUg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SuueWSL4;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 43DE31F00893
	for <tools@kernel.org>; Sun, 31 May 2026 17:59:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SuueWSL4
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 43DE31F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45ee1a56328so3809139f8f.3
        for <tools@kernel.org>; Sun, 31 May 2026 10:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780250382; x=1780855182; darn=kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NtjgIDullXyIPa5oKp5eEqk537C8gpe3ilMzVxuUb5M=;
        b=SuueWSL4w4sq1OdYsxOXHWblsXz9anqcC+cNMROSA9yNClFbWZs8Y7dnkTNYrHvZKk
         lKsuG4jvjk74hjwOgU/TN77qCWLBnite8kpHCXwmQb9R14abnB3rzz1f3rVkdzSuj+ob
         7ooCBli9sM1zA7r/Qp41ifjM0pTIhlkkxskSKjh7WV8xjmoxqwkYMBY9w2S2Hqq2yUtd
         E1AWBpjrUxMR0pilyh7yeBU060Vy8q2K6+SACAdWcxNWafOY58mRPDbRfhvxKCw7yibT
         VaMvwMETAzr1pPhJbXIsAO5iEcoW+xsL9Wp8BLbHpPhL1WT8ngJ8+UGttlrwRm1nWicQ
         gBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780250382; x=1780855182;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtjgIDullXyIPa5oKp5eEqk537C8gpe3ilMzVxuUb5M=;
        b=mLuOjGttuJH324am7R0d5MsQIODNjrmSuIXD9LWH6z8OS4NNLKbu1VcPenqvrRAA85
         GFnbdWXyjJDrT9mjYnQOhPwFKdeF7tK17Zj9eeY+PGaYor/3f/psjl9Rz4sR1hsVbrRM
         JWe+Sf6zD8/ecrF3w8fUQgDpmZGlKOjt4RMYYtmBgUsz1Tk+o9p1MkwIz1IEhnxlEgHP
         HLGQG7cgGns0LfzVQh/EN9uYn4HUQogDQVxhqajSMLV4hcSlLhpWupQA7HaFG9MsarU+
         8siy9k63wqXeuFx52qiOe7un6pCatKPqXmlfj94uztZe5J0gR/TlNfZpipvcg85t54Cj
         maUQ==
X-Gm-Message-State: AOJu0YwCjIZH5A5GB7YaA6pCbuNHmG/YqRxI6brJsI0GtIk6lZMeLL6a
	ZVA7OB2QUhaLHl0TJ9ds7GtsEEik57PUA807p1TMigjZC3NSIwRF6noScV9rrg==
X-Gm-Gg: Acq92OGDhc0bgIXeW6gHuIFeRRP0PeGsr8O9NHdk2VlCfzR6zqeL6Z4ORvfLw1K2Qj2
	xZQyAC1Om/ajePrYqYPlQhKEQqTiyQSM2ncjKF3bVgqpB9Ht6iX/eGLzm1BhFxDmGoJw3WlXFcF
	/s9xeiyypQ0Hx0YOR/25zTy2HIGafTF2CW+E6/mafug7q3Ks6PVdXrN2lStWJSLwLwOY19VmC3s
	T/ccUYW3Ib2CyNdw6mhuP4aRGSSYTESoDMY2SFjbsm2G+FMnzz6g4FDMr1Qqd1ieGfLuY6yZj/P
	ULE0DeRNItAqGwRNE9ayOAymvDyq4GKhpWL9AonQFo9rWOhlqH7KgLBOEhE0h2CPBr/ykBiLb9/
	4nNkRJe98VivUSGHcRoEF4VuzSEMECrYU0tgEA8UALoRskcceZlC9E1NKT9EHFXdkC6tKoIm526
	wLCHmDQYa59sKkq6xPpQFERsDmlKS4Dspu
X-Received: by 2002:a05:6000:b12:b0:45e:6518:21ad with SMTP id ffacd0b85a97d-45ef6aec9c7mr12826269f8f.3.1780250381421;
        Sun, 31 May 2026 10:59:41 -0700 (PDT)
Received: from localhost ([94.53.77.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a0674sm17800529f8f.8.2026.05.31.10.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 10:59:40 -0700 (PDT)
From: Catalin Iacob <iacobcatalin@gmail.com>
Date: Sun, 31 May 2026 21:00:33 +0300
Subject: [PATCH kgl] Fix thread tracking not delivering new messages after
 a few days
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-thread-track-msgid-in-only-url-v1-1-f68f8e5d2497@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQ6CMBAAv0L27CYFgka/YjyUdltWajHbQjSEv
 1P0OHOYWSGRMCW4VSsILZx4igXqUwVm0NETsi0MjWrOqmtrzIOQtphFmxFfybNFjjjF8MVZAqq
 Lc13bK2f0FUrkLeT48xvcYfQBHn+Z5v5JJh9p2LYdDaO3EIcAAAA=
X-Change-ID: 20260531-thread-track-msgid-in-only-url-07ff53b0fca9
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Catalin Iacob <iacobcatalin@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5382;
 i=iacobcatalin@gmail.com; h=from:subject:message-id;
 bh=UoLupISDDRYAdCCnAHPCnYDTKcxyPeLll01dssEweE0=;
 b=owGbwMvMwCX261qtXAKXKjvjabUkhiyZclfb9Vv0M1afD/Qo6HKS9l538af/lBPupWZbz9pLx
 4TIv3ToKGVhEONikBVTZHlx7nrbhj1nAu4l2bXAzGFlAhnCwMUpABNpsmJkuNm7s/70FLlrisuP
 /L5anCH92bjKr2Dy3e7LP7pb71guYWb4n/Og7vsx7/M+R448+Lwi2WLVQvuAWRqOa6+qFMzgkX+
 UwwUA
X-Developer-Key: i=iacobcatalin@gmail.com; a=openpgp;
 fpr=F609BFABD84EB5C9DDDC37EDE89C6A3571CD0E33

Thread tracking was using a msgid:<msgid> query and --threads which
interacts badly with how lei update works.

After every run, lei update remembers the time for the most recent
successfully retrieved email (in the lastresult entry of the
lei.saved-search file). In subsequent runs, the user's query is limited
by lei to only 2 days prior to that time (see the --remote-fudge-time
argument of lei update). Therefore, for thread tracking, all lei updates
after the very first did:
- query msgid:<msgid> AND dt:<2 days before last msg>..
- for every message returned by the query, fetch the whole thread
If the thread kept getting new messages past that 2 day boundary the
date filter caused the query to return no message and no more updates
would be delivered. --threads does not matter as it only acts on
messages returned by the query and there was no message returned.

Note that this behavior applies to all lei searches. In practice it
works out because searches for a mailing list or a sender or recipient
will keep matching new messages so the query will not end up with no
results, searching repeatedly for a Message-ID is the one that makes
this noticeable.

Signed-off-by: Catalin Iacob <iacobcatalin@gmail.com>
---
The dt:1970-01-01.. looks a bit odd but I didn't find a way to do it
better.

Considered alternatives for fixing this which I believe would all work
from inspecting the code and the reasons why I did not pick them

Alternative 1
lei q offers a --thread-id which triggers the server side to do the
search we want (any message in the thread of this Message-ID) rather
than the search lei currently does (full thread of message with this
Message-ID that is newer than ...). However that argument is not
persisted in the lei.saved-search file so lei update can't use it. Going
this route would have required changing lei and waiting for that to
trickle to all users with no real advantage as that --thread-id seems to
trigger on the server side the same code as the one triggered by the
/all/<msgid>/ URL.

Alternative 2
Call lei up with a higher --remote-fudge-time to basically cancel the
date filter that lei adds. Also works but seems more indirect/hacky and
it suffers from needing to pick a value, is 10 years enough etc. I did
check public-inbox code and as far as I see there is no command line
argument or config to disable this date filter for lei up except for a
high --remote-fudge-time.

Alternative 3
Remove the lastresult line from the lei.saved-search file every time
before invoking lei up. Needs knowledge of the path to the file,
violates layering by reaching into lei implementation details.

BTW, thanks for korgalore (and b4). I'm getting started with kernel
development and they are an absolute boon for watching the lists and
sending patches easily.
---
 docs/usage.rst            |  2 +-
 src/korgalore/tracking.py | 10 +++++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/docs/usage.rst b/docs/usage.rst
index 66c6ecf4a098..779b190aaa8d 100644
--- a/docs/usage.rst
+++ b/docs/usage.rst
@@ -539,7 +539,7 @@ How Thread Tracking Works
 
 1. When you run ``track add``, korgalore:
 
-   * Creates a lei search for the thread using ``lei q "mid:<msgid>" --threads``
+   * Creates a lei search for the thread
    * Populates the search with current thread messages
    * Delivers all existing messages to your target
    * Saves tracking metadata in ``~/.local/share/korgalore/tracking.json``
diff --git a/src/korgalore/tracking.py b/src/korgalore/tracking.py
index 2d12e484aa8a..dd26a33c046b 100644
--- a/src/korgalore/tracking.py
+++ b/src/korgalore/tracking.py
@@ -6,6 +6,7 @@ storing metadata in a separate manifest file from the main configuration.
 import json
 import logging
 import shutil
+import urllib.parse
 from dataclasses import dataclass
 from datetime import datetime, timezone, timedelta
 from enum import Enum
@@ -345,7 +346,7 @@ class TrackingManifest:
 def create_lei_thread_search(msgid: str, output_path: Path) -> Tuple[int, bytes]:
     """Create a new lei search for a thread by message ID.
 
-    Uses: lei q "mid:<msgid>" --threads --only https://lore.kernel.org/all -o v2:<output_path>
+    Uses: lei q "dt:1970-01-01.." --only https://lore.kernel.org/all/<msgid> -o v2:<output_path>
 
     Args:
         msgid: The message ID to search for (without angle brackets).
@@ -360,8 +361,11 @@ def create_lei_thread_search(msgid: str, output_path: Path) -> Tuple[int, bytes]
     # Ensure output directory's parent exists
     output_path.parent.mkdir(parents=True, exist_ok=True)
 
-    args = ['q', f'mid:{msgid}', '--threads',
-            '--only', 'https://lore.kernel.org/all',
+    # We use the dt:1970-01-01.. query to mean "search for all", it's the Message-ID in the url that
+    # returns the full thread of that message.
+    qmsgid = urllib.parse.quote_plus(msgid)
+    args = ['q', 'dt:1970-01-01..',
+            '--only', f'https://lore.kernel.org/all/{qmsgid}',
             '-o', f'v2:{output_path}']
     logger.debug('Creating lei thread search: lei %s', ' '.join(args))
 

---
base-commit: 9060fd4d0d24895e29ca6d982bdd22b64ea45220
change-id: 20260531-thread-track-msgid-in-only-url-07ff53b0fca9

Best regards,
--  
Catalin Iacob <iacobcatalin@gmail.com>

