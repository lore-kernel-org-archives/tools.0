Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1543AF676
	for <tools@linux.kernel.org>; Mon, 12 Oct 2026 05:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791784721; cv=pass; b=URCJQ+sgFinvpR0pc7UsYEKPvXiz1UbGJOhSfY8sheG1OJrnfGLxo1p5Vat5qFBHuWHEogwgw88WxwcdImG9pI3EwKmLpIlCU/rerRhKKJAOrr+cr+nI995vklGcPMqXfk0h9vh68bFULP2q/HS5SPOrZPLpveM4kWV1wremlsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791784721; c=relaxed/simple;
	bh=Cbg9aEUh/JDM656LYLt32BhSbUiNmuQWfngBHK2LvYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g4iZeBg0EH62+5rUCPhpohCeLEf14IHeyYE0/SQq76hnYhUoimTJnf0M5qV+3YYfNO0cd7LIJkZciaP70H87l0BKVFP2vMbxndOsUt12hfWELrcVHAbzf0tAmKp/tRvMwdXwP/3KMBzUn6iM/mPvs3KYBga+Lk2h61bZGsT/Hnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CYVLVO8p; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CYVLVO8p"
Received: by smtp.kernel.org (Postfix)
	id 23C881F0089D; Mon, 12 Oct 2026 05:58:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791784720;
	b=om+p81gxXeO+FIHE+QAdew1fBaE5lbwQK2cNRkTf3fPWQ9LtFnNH8kyhup2lOvtHUBle
	 Cvv5EKZb2WV4dnLp4oHhseAd3XdbbqlqCYMJc2K7Q/fejYkmFcpXUnrQFLmMjRduusQOb
	 qvVF6LuXTd/l9KcNRFxMWPPPxiE1DT4VYJgEY5S+rBQQ5mM5X8QVRH+azpkBZ6XHu3P1s
	 sQXf2SYWIv04Im+NHWJXnvJHbjw8iM6sRYIHUmqjtYzc/0m6pf3iP8hzVOX9MttELVrdn
	 TIJBKu3qyUrPSPKvKosyIObJqbS/ALuD4yhpjmSr/9pfFMGcdEYCVqJ3OEmCIScH1hQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791784720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Fpk06K1mqRGb9luaGUrH9g8epUO6EkARKTgDSXDrO2c=;
	b=R0SSrzBPtRANpgF93//KiKzjpA7vMPPzw0t4S9/1ng0QW/tBUYLCs8pjZZ++HDtrak4a
	 v6iD8J4gxfA9SMN4PdRGy95r1e9NwrhKJWyaO83ZABU5ksauA+rmdzHs+aJjGfxWJXLtX
	 BwHZrg9XC3ZWB02sHQuWMfG9fSIhVJaTTegk/d3MQPdq2Rwgt/mZsH3WNGwGbFvvwqcNN
	 rF/Q4xpQ9UMg8bukifONtpCiN/WP+L6NRovGOF24TyBQOsRWlBvUaJkBfeKaK5vbRV9ua
	 HvFFB2P8/wtIVYEMlHS0TudOdX8W0ws+b8v+xNoaLQCUMvYWHs2O3YPDXzcbR8DieBw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CYVLVO8p;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9524B1F0089B
	for <tools@kernel.org>; Mon, 12 Oct 2026 05:58:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CYVLVO8p
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 9524B1F0089B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3115c4451c8so1627054eec.1
        for <tools@kernel.org>; Sun, 11 Oct 2026 22:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791784719; x=1792389519; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fpk06K1mqRGb9luaGUrH9g8epUO6EkARKTgDSXDrO2c=;
        b=CYVLVO8pBrtW5uHT5Laff8DabZFpHgQsqlpWs3BQUCLPxXALfmlv+ddEc7Vg5IVKgU
         GfCDDSPZ6sRzSEedhU/IoAvei6yCWZmA4e7ExL3v3X8A5j94yL08Kw4RUUBgmu3Kff45
         7QoYLtQefeFL0qEjxM/XCom1yg84aiMhaQbuOtpGqscJEYyTID8xMJITp4CYKXIKEC1x
         BPQN9o46tEPtL6H+HEYDMQ58WM88VFjY5gVxpjHFbfSvgETdDjeK1w91p63sTNuDKjLl
         NHumeGN6StvOna96f7/PxuvDC5CzCuupaQDJHPxZW0hbX/4Ww1RJ+rBi6qbPNbWEHmH0
         c/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791784719; x=1792389519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fpk06K1mqRGb9luaGUrH9g8epUO6EkARKTgDSXDrO2c=;
        b=Ebue0c6u4Y/6MRn6dDK4XUgdWfhyWE7AmptOZcEtbWhGpqgRLJ6B6UXi0Cd/Cit5uK
         Joy303EBYcKZZV4YhMXQO48/TFJ9kWEL6dugDpSCBYEjM4cQvLEMnxcJUhI72+0HpUwA
         kttYEaGg7QdrNcV/hHe/RuadyFoMQ2U8o1gixImwUtnsa6axxU3RgKYJ9z+1F5UZSylo
         RkbRMW6//dazEkUVC4oO06yDuyRQgqrVAUYkeeJpwqGWnTnkixFbbLehWGXWryiw/Qca
         /EmQGrFdhDYJapX+YeeYqT1fT+S8XGzCuWzXmKFDCb50CrREAkutyhNy9HsEmg7y6do5
         2RoQ==
X-Gm-Message-State: AFq9FYJ7jYQCEnBqhx0l3aAQ2nzDZgnw/CBPTpE1PZrerl6wRKyAcHh1
	iori1uN7iuAMijMK/rAFzozm3TVPaLAatT/s6OkggPY3FcpI56/2bCZW
X-Gm-Gg: AYBFou1aqE9HsiQUE9AMieO5hfch9vE1uLbWw/2AlFxW4c1mE2yCl6ST21kLRbaIhuY
	5uV3+SDLTloN6wffL+Y9qSSjKjYBB+FNvgRj0acKLsup5O2goYCPstO93qNBG+H+Rol/oEl9+Km
	MFLraiEMzYCKqVb/agBWcHkHVLaJXCs/sNOQdmsbVeS4IhwgSqSvYItbvHQPwzpr29Rca42pORM
	1NAUfD7Y1WneAtoSM3LScs7C+3o3r9wr3v+ee3CGgMDorzLxrw7r2X1Ztydhrlo6oqHi1Aqej7w
	RH9PBu8WjNWXiPUKIAKEZDtALnfLW2BekQ6c1qhEgfE9qgVVqj3bef7FZ6/K3Geo/HjQKcywCZq
	Oaul4jomivZXvlHomZe58x0Wh2x7VZBgviUdNG9+bwHIFpDMEuU5r7aMOaD7UFKmPhBJ4GuKcNn
	fFh/XJE6kzmgrX2VX6PVx6QXHl+ntnYpILxpyFieADAId9XbYjJUuzNLOTBHlJhluiqfYrTw36Y
	muVEi7GkGYav+P/Mzcy46CmxpDhq1mKXc00uVmwafO3510boClMI23Nn2kMje3PXgRdcpkT9g==
X-Received: by 2002:a05:7300:3aa5:b0:353:5e26:1b97 with SMTP id 5a478bee46e88-3536c4bde18mr11396869eec.9.1791784718588;
        Sun, 11 Oct 2026 22:58:38 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8999:e631:ed58:366a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b19c6c7b4sm3101612eec.24.2026.10.11.22.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 22:58:37 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 11 Oct 2026 22:58:26 -0700
Subject: [PATCH b4 v2 1/5] misc/send-receive: support BCC in web submission
 endpoint
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-send-series-bcc-v2-1-cd17584c40fb@gmail.com>
References: <20261011-send-series-bcc-v2-0-cd17584c40fb@gmail.com>
In-Reply-To: <20261011-send-series-bcc-v2-0-cd17584c40fb@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.17-dev-36fec

Support receiving and processing client-specified BCC envelope
destinations in the web submission endpoint.

Extract optional top-level "bcc" list from JSON request payload in
receive(), validate email address format, enforce max-client-bcc
limit (default: 10) to guard against relay abuse, and merge validated
addresses into destaddrs for SMTP delivery.

Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 misc/default.conf    |  2 ++
 misc/send-receive.py | 32 +++++++++++++++++++++++++++++++-
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/misc/default.conf b/misc/default.conf
index 100c8cd..2aab3c0 100644
--- a/misc/default.conf
+++ b/misc/default.conf
@@ -29,6 +29,8 @@
   # Always bcc the address(es) listed here, separated by comma
   # Useful during initial testing
   #alwaysbcc = one@example.com, two@example.com
+  # Maximum number of BCC recipients allowed in client submissions (default: 10)
+  #max-client-bcc = 10
   # If dryrun is set, the messages are printed to stdout instead of
   # being actually sent out. Useful for testing.
   #dryrun = false
diff --git a/misc/send-receive.py b/misc/send-receive.py
index e1cf98e..22e049b 100644
--- a/misc/send-receive.py
+++ b/misc/send-receive.py
@@ -18,7 +18,7 @@ import textwrap
 from configparser import ConfigParser, ExtendedInterpolation
 from email import charset, utils
 from string import Template
-from typing import List, Mapping, Optional, Sequence, Tuple, Union
+from typing import List, Mapping, Optional, Sequence, Set, Tuple, Union
 
 import ezpi
 import falcon
@@ -519,6 +519,33 @@ class SendReceiveListener(object):
             return
         logger.debug('Received a request for %s messages', len(umsgs))
 
+        client_bcc: Set[str] = set()
+        if 'bcc' in jdata:
+            jbcc = jdata.get('bcc')
+            if not isinstance(jbcc, list):
+                self.send_error(resp, message='Invalid bcc payload format')
+                return
+            max_bcc = self._config['main'].getint('max-client-bcc', fallback=10)
+            for entry in jbcc:
+                if not isinstance(entry, str):
+                    self.send_error(resp, message='Invalid bcc address format')
+                    return
+                parsed = utils.getaddresses([entry])
+                if not parsed:
+                    self.send_error(resp, message='Invalid bcc address format')
+                    return
+                for _, addr in parsed:
+                    local, _, domain = addr.partition('@')
+                    if not (local and domain and not any(c.isspace() for c in addr)):
+                        self.send_error(resp, message='Invalid bcc address format')
+                        return
+                    client_bcc.add(addr.lower())
+            if len(client_bcc) > max_bcc:
+                self.send_error(
+                    resp, message=f'Too many BCC recipients (max: {max_bcc})'
+                )
+                return
+
         diffre = re.compile(
             rb'^(---.*\n\+\+\+|GIT binary patch|diff --git \w/\S+ \w/\S+)',
             flags=re.M | re.I,
@@ -761,6 +788,9 @@ class SendReceiveListener(object):
                             msg.set_charset('utf-8')
                             msg.replace_header('Content-Transfer-Encoding', '8bit')
 
+            if client_bcc and not reflect:
+                destaddrs.update(client_bcc)
+
             if bccaddrs:
                 destaddrs.update(bccaddrs)
 

-- 
2.56.0.385.gd3acb90ef8-goog

