Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E72323D
	for <tools@linux.kernel.org>; Fri,  6 Jun 2025 19:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749239488; cv=none; b=hj1E/yJlUQzoBJhUWavU4dXGY4+9aUz+ozWqEaE1Zuw5CJQQU4HxD2z4fUC37wSdQFfJIW30hce6U3gmQ1i1S9TL8K/6THocNMpBCWYYSUwtU9+WB0XiLMG3B3tkjLcZBnhZPNx1HVscZFmVJYzU38JAeBdH1B/sVUOvs26KnLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749239488; c=relaxed/simple;
	bh=fpEMdTvdhrJt3AToTk+112BCd5Q3pl/YSKWdYrlA3B0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qv+TbSHJvVi+EBccNCcoYfi/HtnL2lzq/mF8c7cQElpRGC494aveCJcylPWETA4GM7Zn/omPGvnIDQi3UQEYUdO7h7Y0B8I1Mo9MivbV6RwyPlRuPCydhwlUo5tKJjI73lJBkOhpAAjHh2LhOYjQ414ZBt53ntzVhIO376u6z7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MqbpBWt2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MqbpBWt2"
Received: by smtp.kernel.org (Postfix)
	id B4D12C4CEF1; Fri,  6 Jun 2025 19:51:28 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C7944C4CEEF
	for <tools@kernel.org>; Fri,  6 Jun 2025 19:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C7944C4CEEF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7cf749ef9b1so239510685a.2
        for <tools@kernel.org>; Fri, 06 Jun 2025 12:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749239487; x=1749844287; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Oplgip+r6DBukq+pRT+fJ/p2o7GzwXps5uk+cZYGFg=;
        b=MqbpBWt2i768bPylF2HE+m77RFxjFl2ekKrhxQ+PgTuJ4kIjT4kxuQHMWWFWvawkQv
         ac2bzbn8ESomKW78d2QMDcrMIBDkjraFb6i7eMt0v/XpQbkXL37L6d7SO3LGE2Qk3ye/
         lFq6SPdhdBQ6s82tUKsF+uN4YOiCtZcyU9ZGX3NWU9RYQmCHn6WVqmlLPwdAAMku9//k
         BjEQluH0+2jkSkhCupgHz9ZSjBK9GZseuV0LFclqcGHNnrx9OtZSpKKVV4B5GSct55P9
         SmvOsvffVK4MAEfiQNP1GuFH2pgUBcj/DqrzoHnt7MQ4XO4EU28bWzVDvS5+CJmts3u4
         0ePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749239487; x=1749844287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Oplgip+r6DBukq+pRT+fJ/p2o7GzwXps5uk+cZYGFg=;
        b=bX6NDfh9z5v/kRC259WCTCBY4TwTRi4PTh3+LziwAqFjVTDzoOgCUazxJ9dRYpl/6D
         R+QcpVTBSsamqlHKSHbbSBCK9EkJ08lDkXOOfu6oJpDYz2JjFTBlopLQD3T1GJgjPSMM
         J1/FNhfVXQKf99h1zLNmVweN/mmSDsAAjEMHL5die6V4gf9Xm3dsEytyNF3Y9ghaXL82
         w/yyFBIpGiezo6lvRP7ZmL3IM9NOI/FfqvQvyPkg5+owL8NOme0LDJ+2a2F8x+05NDAN
         V874CrMZ4jVwVXuuB6toYbFYHpXqwtwEWL/MCYCCFew8JBub+WrMR/sqMZYDkByAlxUd
         eMYQ==
X-Gm-Message-State: AOJu0Yzmz8Fmrn4CR17lzSvpvmGT9FBHQXzLkrtJ/p9e8ckisRobBB+2
	FVbMpdyhunXqfjIFAVrfH2xKGR5ra5gLRWmnuVDvHmnRhR9HshRZNIupGnsA+d7j
X-Gm-Gg: ASbGnctbWOVlwKBu9rF83yVoTe8rRnfB9KmZnUlwNViuEe1MPT6Jce8dQkt+NQ1mnaV
	BR82yAs4WGWY/44ZD9+bqR0o0jmw+PsMmoMtzPs+IHBRe3Ajr4wkLic82ujAJF5QmxMwPUJbE7P
	BzF6Vrj3U3KiUgrjVJ45xEtxsde/Mui18XgDSdCBaJrw8v7x87b/wRQsEijkfyMQNoAZ0GAg+Ue
	5Ixz1GfCjAO6vGH/k1hlMYr4w1i2t5KW8s87cCd4GVjmnQwBn6B3HA2zuHOt5Rp6EmlENB0OdJ3
	4aj+f7oHRgUk4dkuq97XGmUs31rIYn+E4skHIRbvyJWf1Y7dzlS+2SjPHGatjUXfp09NnPQIhA=
	=
X-Google-Smtp-Source: AGHT+IEc/qUsLWhQ9flkSA/kfJrRHefQ6JS7kSvm0P7ZDCe0QrV8B+WiJjKsNjOutPErjwz6uCO8bw==
X-Received: by 2002:a05:620a:44c9:b0:7ca:c9cb:ab1 with SMTP id af79cd13be357-7d229851bf8mr811448685a.7.1749239486620;
        Fri, 06 Jun 2025 12:51:26 -0700 (PDT)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:d553:69f3:49b:5c70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a619895298sm17718521cf.81.2025.06.06.12.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 12:51:26 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 06 Jun 2025 15:51:19 -0400
Subject: [PATCH b4 08/10] Check variables for None rather than exprs
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-uv-compat-v1-8-c76c1c8d6eeb@gmail.com>
References: <20250606-uv-compat-v1-0-c76c1c8d6eeb@gmail.com>
In-Reply-To: <20250606-uv-compat-v1-0-c76c1c8d6eeb@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

This allows type checkers to better understand that these variables
can't be None.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 src/b4/__init__.py | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 804169a..a66c78b 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -207,10 +207,12 @@ class LoreMailbox:
         # To qualify for a partial reroll:
         # 1. Needs to be version > 1
         # 2. Replies need to be to the exact X/N of the previous revision
-        if revision <= 1 or revision - 1 not in self.series:
+        if revision <= 1:
             return
-        # Are existing patches replies to previous revisions with the same counter?
         pser = self.get_series(revision - 1, sloppytrailers=sloppytrailers)
+        if pser is None:
+            return
+        # Are existing patches replies to previous revisions with the same counter?
         lser = self.series[revision]
         sane = True
         for patch in lser.patches:
@@ -245,11 +247,12 @@ class LoreMailbox:
         logger.debug('Reconstituting a partial reroll')
         at = 0
         for patch in lser.patches:
-            if pser.patches[at] is None:
+            pserpatch = pser.patches[at]
+            if pserpatch is None:
                 at += 1
                 continue
             if patch is None:
-                ppatch = copy.deepcopy(pser.patches[at])
+                ppatch = copy.deepcopy(pserpatch)
                 ppatch.revision = lser.revision
                 ppatch.reroll_from_revision = pser.revision
                 lser.patches[at] = ppatch
@@ -353,12 +356,12 @@ class LoreMailbox:
                 if pmsg is None:
                     # Can't find the message we're replying to here
                     continue
-            elif fmsg.in_reply_to in self.msgid_map:
-                logger.debug('Found in-reply-to %s in msgid_map', fmsg.in_reply_to)
-                pmsg = self.msgid_map[fmsg.in_reply_to]
             else:
-                logger.debug('  missing message, skipping: %s', fmsg.in_reply_to)
-                continue
+                pmsg = self.msgid_map[fmsg.in_reply_to]
+                if pmsg is None:
+                    logger.debug('  missing message, skipping: %s', fmsg.in_reply_to)
+                    continue
+                logger.debug('Found in-reply-to %s in msgid_map', fmsg.in_reply_to)
 
             trailers, mismatches = fmsg.get_trailers(sloppy=sloppytrailers)
             for ltr in mismatches:

-- 
2.49.0

