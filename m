Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CC42C0296
	for <tools@linux.kernel.org>; Mon,  8 Jun 2026 15:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780931256; cv=pass; b=ik1MKeVA1kdwG+MGDFk9c7HNooWw8KVPBt6Ihytgsn8EjuyXD2CL9CIx+pp3KURrmzk4hR8RxLGuJ5jvfn4e68GuVDp6cW56SIW7gz9wYKGDC2fxhP77hxLGgH8Jh7eMrXG92aV9PVn9CeCqP5fiAa0JoQJj3EYIH9igwPuU1ic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780931256; c=relaxed/simple;
	bh=HcfE9ke/h1MTyioaDbEs0Uw7tV7cLz/Cd2/15o94tfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:
	 In-Reply-To:References:To:Cc; b=MXVZ7PkTbC6PbeUxy2gWjUiNpQHQb0anXoVgaIYGJwO998BvC+XyBxAiWV1KoNIzdoJOBSrKhaclul0uYYVcxifwROzTWCJ+B9Z+6gQqdDUZUJwfCPEys17nkn+ihub2AuEoOMq7wtYjEfqPxNMu8mQJZu7+YKVWfiWZKVtLaTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o9ctmXoi; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o9ctmXoi"
Received: by smtp.kernel.org (Postfix)
	id B5F101F00898; Mon,  8 Jun 2026 15:07:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780931254;
	b=sihVfqck6qaRQWkrT2wpTIkHTJCFDMGb4d4Oug0T+gVrqX6K65aWepCwmcUDrEjrkj2V
	 nK6go2H9N4ugzUQM9ZSE9OUMnFkOtw6DxDoi2nSF9nlKMR253qt7kJ7X4jXnTyzcQppqH
	 xCmzppt2M0Xy6ZaZeIHYu502OuxNzZQF77fGRBcoxkBeMaIlhU8v3VCEBustdN1SYdguy
	 Bd9zx1z1xTFFQfiAq0r9VOeBILt45iPCPIR7pr7YT+mU3VersSzYXcQNenlbj2EBcQEMW
	 Y77xz1qYLSPUJlPTa1ECVITabBRUozsekIYkS5NzUDmLSmBxQQajGlLLUG4/XaNxQyA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780931254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:In-Reply-To:References:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=BTgvNAM3USCrGmUYSdxsq0aIqzPxyCN2cnN56A4LV2k=;
	b=IgFv/Pyh+8ilYXzmYAHSi8ZGXg5JYKO01SA9cNs8o5rgMzL9UkZcXfINaIK17/i/FGPN
	 pc5Yk4m1UACCaXqKbTBv/26pX4NGBkMbHXoMkFi4UARVMfqtSo9KMfRzfec3xr4FDAWXz
	 tIGyBbcCM8ZPAiGsSyc6VMe8b2QNspWaFRDi7oX+2+OldA2BEoAIq+Z4qZZAhmrjTLyIm
	 H2jtV5sjBnMcq4tDBhfghKH4hFTlnaXAYU2oHt7CCB+eethdVjG9dXJfq3P4trNqZ10QB
	 D0AFI+CWABn4nDxoEsEN96bmGhOKzOgrk5ZD9Ctj7ZybPYvgfgbVemNXxLbJmZowz+Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=o9ctmXoi;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D501F1F00893
	for <tools@kernel.org>; Mon,  8 Jun 2026 15:07:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=o9ctmXoi
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org D501F1F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b915ded5so37868945e9.3
        for <tools@kernel.org>; Mon, 08 Jun 2026 08:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780931252; x=1781536052; darn=kernel.org;
        h=cc:to:references:in-reply-to:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BTgvNAM3USCrGmUYSdxsq0aIqzPxyCN2cnN56A4LV2k=;
        b=o9ctmXoicYxAR3ktgVzntJvgqrJsjqLKjEBfWI7NGxYPDJYRTzEc7x50L5Hgng+uDS
         NRr09e51REXoXoZfBIu3q/Mpj+lS3SDfm0fRLQh8oj+x6JLuznfzbejJIaQRzd/rp2eB
         zCZoIVQTr8+sI8Xb7p/+vf3NSuL32YAmwb6xL1wm+igQjQ591AC6bu3nXLgIrCjnNjYc
         D9GJjIUV9hruvaMCeXTcsGOeZnit7f+8WUwcXJ6aPcYZLu4LUKuqjjjNDO9zy319UmJE
         EJL3LY+papC3l4VsABmAWiY43EiC/FMMt6yqlfHBiuscypdRnyOUnAkE9POKiAHZmjDn
         yzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780931252; x=1781536052;
        h=cc:to:references:in-reply-to:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BTgvNAM3USCrGmUYSdxsq0aIqzPxyCN2cnN56A4LV2k=;
        b=lvU6F6OU4mxmGotuI1iNU3m5dpZTx6yCOHY9m6BQ3RZ9+vUUbntlRmD1894ur9IWWU
         44P26l2MYvY7IWhkWbKP9h4CUJ3eHbLItniVPWI6Zg+8GZfF815N3VMBtfqlNRFv4MXL
         eArGPOEGVDLAwLIKpklWAlmppGJ0MGqqtQw+cbfeTMY5Cf9Y7Kk7YNYnz/trgNCJWa3V
         Y0q+8TTBWdrNyYRb6Er9Du8Sq1t8j02CHsHEcTbsWQiXwtaNgSfqS/IQ1fY2QQv4BT+L
         fG810CaIucGfIkJ8/cI07HSLOL73zWAxz6fx5B8kjNhPmxT4Gsk/FMfoqMoTtS7GaBnY
         bM0A==
X-Gm-Message-State: AOJu0YxDkejNYl+8r3VDfrDTnvQXgWXeAsZ8Z8WquTByjtF68+c+iYzC
	dBnU3AWa02ltTA4J14vfg6FTr1FqxA4HNfzoPphVUaFL+PEwS7V0mPVu
X-Gm-Gg: Acq92OHJQmAtqnaWHlWEK9ihcx3kSqzIMDho6QLSH6joi4D18VVVDpb6j5XBKDh6/cv
	m+olYuuUdUvIfJn7EZcVkoduintciGOFoQhAry+gjBKFvqLzLobCg99f6OnUTVqmKCxdmbAPKAm
	B1BR2feD1vV8u8M2yZs09Drgj/LKcKvOUCDHlLZibyxMoTv2+qpNvObhNmg3rOaApqXGhYCFCvB
	QEOl0143KjxfejL2iDqCBeRjienv6ZYvkymAwaXWQi/rw+Q4inmVj9+xFmcG94qYCOkikaHbx89
	vv3uG0sHe3z3Ug3F7OqewHS3TeYFbwdUkKnF+LR4NOxUKpyqSEajiFBWKB5WlLfMy6OMK8zLxKr
	mTXgqLvKUzQOZRS6eSYl3ztBdockrLo5j0I9fkRF3heerYWLyU24LUTwthFara4wypmRHkLDAsC
	YT4bnis/GNiZlcg4TzOS0MnCtUOasMC/tI
X-Received: by 2002:a05:600c:6389:b0:490:33b3:4be0 with SMTP id 5b1f17b1804b1-490c26233abmr278930535e9.20.1780931251940;
        Mon, 08 Jun 2026 08:07:31 -0700 (PDT)
Received: from localhost ([94.53.77.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35fb24sm56416451f8f.34.2026.06.08.08.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 08:07:31 -0700 (PDT)
From: Catalin Iacob <iacobcatalin@gmail.com>
Date: Mon, 08 Jun 2026 18:08:36 +0300
Subject: [PATCH kgl v2] Fix thread tracking not delivering new messages
 after a few days
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-thread-track-msgid-in-only-url-v2-1-29d929e3542b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/42OSQ6DMBAEv2LNmYnAhPWUf0QcjBeYACayDQpC/
 D2CfCDXVqmrdvDakfZQsx2cXsnTbKFmPGIge2E7jaSgZsBjnsdZmmDonRYKgxNywMl3pJAsznb
 ccHEjxoUxWdrGRooKIgZvpw19LsEThm6E5jf6pX1pGc7rE+vJh9ltV8aaXPC/xjXBBE1emlJni
 t+r4tFNgsabnCdojuP4AoJ6zyXjAAAA
X-Change-ID: 20260531-thread-track-msgid-in-only-url-07ff53b0fca9
In-Reply-To: <20260531-thread-track-msgid-in-only-url-v1-1-f68f8e5d2497@gmail.com>
References: <20260531-thread-track-msgid-in-only-url-v1-1-f68f8e5d2497@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Catalin Iacob <iacobcatalin@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6178;
 i=iacobcatalin@gmail.com; h=from:subject:message-id;
 bh=HcfE9ke/h1MTyioaDbEs0Uw7tV7cLz/Cd2/15o94tfQ=;
 b=owGbwMvMwCX261qtXAKXKjvjabUkhiy1Wz/qf25M53rmunNB0eS+9afrbrV8j9tv+MM0sq017
 0/6syf3O0pZGMS4GGTFFFlenLvetmHPmYB7SXYtMHNYmUCGMHBxCsBEnJwZGX6enaFQ+mb2D16l
 pVzaLuwqChOfMMR9WPUtsp31vJb0fmtGhnW/PqQKvW/ofHXqw4F0tpJloeInXd/9Lha4UnDniu/
 Rr4wA
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
The dt:19700101000000.. looks a bit odd for saying "all" but I didn't
find a way to do it better.

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
Changes in v2:
- Switched the datetime for "search all" to 19700101000000. I ran with
  the v1 patch locally since I sent it and noticed that at some point
  right after midnight lei update failed because it passed 1970-01-01
  through git approxidate which led to weird results, probably because it
  was so close to the Epoch, did not trace the code much as my Perl
  knowledge is very limited. Spelling out 19700101000000 fixes this by
  making lei use the date as-is as seen from the code [1] and from my
  testing
  [1](https://repo.or.cz/public-inbox.git/blob/8a3c04bb01b243c28515df77e8ca647ec54dec01:/lib/PublicInbox/Search.pm#l381)
- Link to v1: https://patch.msgid.link/20260531-thread-track-msgid-in-only-url-v1-1-f68f8e5d2497@gmail.com
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
index 2d12e484aa8a..cb71a7f36b70 100644
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
+    Uses: lei q "dt:19700101000000.." --only https://lore.kernel.org/all/<msgid> -o v2:<output_path>
 
     Args:
         msgid: The message ID to search for (without angle brackets).
@@ -360,8 +361,11 @@ def create_lei_thread_search(msgid: str, output_path: Path) -> Tuple[int, bytes]
     # Ensure output directory's parent exists
     output_path.parent.mkdir(parents=True, exist_ok=True)
 
-    args = ['q', f'mid:{msgid}', '--threads',
-            '--only', 'https://lore.kernel.org/all',
+    # We use the dt:19700101000000.. query to mean "search for all", it's the Message-ID in the url that
+    # returns the full thread of that message.
+    qmsgid = urllib.parse.quote_plus(msgid)
+    args = ['q', 'dt:19700101000000..',
+            '--only', f'https://lore.kernel.org/all/{qmsgid}',
             '-o', f'v2:{output_path}']
     logger.debug('Creating lei thread search: lei %s', ' '.join(args))
 

---
base-commit: 9060fd4d0d24895e29ca6d982bdd22b64ea45220
change-id: 20260531-thread-track-msgid-in-only-url-07ff53b0fca9

Best regards,
--  
Catalin Iacob <iacobcatalin@gmail.com>

