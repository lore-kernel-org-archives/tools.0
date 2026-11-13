Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794600153;
	b=ZwMLV+qxMOSBrgh0uBvzLXdUxWD9JKrEyh1mPNpSdgYQS4+f7Qwv6o7JruR452k4Piee
	 rz5ZwTUmf/JyQMu66jIr7s7ZDN9FmQ+bFmYQB8dLa5ogy7f0jd6yd4H7HkDJ06Stmw2Ho
	 qQs6kcj828R0NbjQ+kFj+58J1Y3R6nvmGsDEoTtN46vWtLjjwn97mEFSOvB4lTOrJsIvX
	 Bc5yBSH3OTuzuh09kIIRYQN+FTT9tDXcvLbhRl+gctOyJORMb/GSTBxRBU2uFMKuTFVRC
	 bXjGg6SrlTlG4TpgLkNq1k7DC9+kem9EHMHQu+DXmwCa6BxgMH98n78tMm3UAllZReA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794600153;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=mx9kb7wA0IwnPEGkBisbH4SJjjPBAP552DunCYumwlU=;
	b=CaDFZDT8mBUerl/sdBKrMNtxVrsSd0R6t94uMIrMtsCAMe632Of3B97kkCgwfRLo/c3R
	 Ha65NYnGrramPMepRbiFyz5/T+Xg1aru9kWNUOGXl5nS8RK6nyZnUIYZKI8/GbDxG+gOZ
	 aHOlcAkygTXCBZJgnZIUtnyiMAC5199tl9ngbpkb5HodTbbvSy/OG4dHC8R0HYUfHIZXO
	 vnlSUvfwzrvAZPAIej5nsoggz8iNy50MFUpx+QntLXP9sfgLqKI8W+ldtB58Uwk3MqkSL
	 x6biGf/BNriBH/iDtmEEkWnKEKU5wqsS9jjF/bjbOlBnJUdblO/NrQjIpQOFbEl7VRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fyAaNzGp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60859606A331
	for <tools@linux.kernel.org>; Fri, 13 Nov 2026 20:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fyAaNzGp
Received: by smtp.kernel.org (Postfix)
	id 150671F000CA; Fri, 13 Nov 2026 20:02:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794600153;
	b=grg25DiOjnln8Odu1QWkYCh70YHLYT941xfRhbEhw9C5OT0sBv6tvmMuZ1fBobnk8Qei
	 YWnJcVb5SZODUBCdyFSvWq6MjF8amelQVLIO71oyUH5/VqY1os9pGjlaD1wjqp5K/Qnvg
	 bdlB9B5A2dD1Rg4hFKyTjuKIGBvZ97wuEYnNgQYYfsHglYrhtNIiG+f27D8GuBuYex3gN
	 3CtO2aDL4I7P4h2xd5ATmQ25bS2PtCriJDSJQHv11wgpqKDPL+qUkJdbKS/UiWqE4hLTB
	 iEF7WlcDsDvLHN8vNf/L3q+bDVec8tPo8REE3UvLuAzAuT6DOV1pt7hTuumLZKm5rxQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794600153;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=mx9kb7wA0IwnPEGkBisbH4SJjjPBAP552DunCYumwlU=;
	b=xU4ZiKyYcT198D1M/SASGnWwRWZ2RoWEexp22bkLff1J77X0+CHb5HNl6KlStwzDEIbX
	 zczMqVGqtNBBfgLvFtiTLHzTP1yofyBDwkqCbZ5loc55yjSwcbKZhsloE8mV2p507Ti2b
	 bM+0+MYvutXj++ONbgGMka8NNRs0rJWGM5n8evci9EWdmp9wJURM8GgsQtvjmdUulBaxH
	 H9lcHaRd0GFKGo32TTK8QRCD7n0XzNOUzKGGoViKWIm/L/2pWYen720Mv+R/XOkZC6dyA
	 0nLQAGQIagtqYBhMHE2bYpAGmHcXbG4lbTzNDyY8XW7tdUv+Xec3fyZqDIkXX4SP3xQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fyAaNzGp;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7CDA81F000C5
	for <tools@kernel.org>; Fri, 13 Nov 2026 20:02:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fyAaNzGp
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 7CDA81F000C5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6f5a0893610so1809367eaf.1
        for <tools@kernel.org>; Fri, 13 Nov 2026 12:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794600151; x=1795204951; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mx9kb7wA0IwnPEGkBisbH4SJjjPBAP552DunCYumwlU=;
        b=fyAaNzGpgQ5Z2triPt/DxSkYgwCndvsqmMp+nEliaJz+yI1B2DlojIcS2BjAjfrLjK
         pN7f7Ww/iCS6rKiNl2owdMsaHHLdq5t8VeacFLXbh4iV+pDVcj1teVCe75GL9uA4Wc2T
         IlUnpAv+VEKO5mPkQRoB62NAFn/l8GED/YzR93uq4HEHX4B7pFXztmBXDBhi6aBF6rK1
         evNV/ObV89cAXBfoiVQa7Q/vNWsNbTjoECx7UtiqD1VbYe0eq6BYSAgF8NngV/x7y2UY
         3P2p0mlGInDHNzPnTpYZOmOYMAiViSYSwYMTU2aGEpTMHnQzshBE9MjczXjFfNkObuL2
         w3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794600151; x=1795204951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mx9kb7wA0IwnPEGkBisbH4SJjjPBAP552DunCYumwlU=;
        b=iJ5V9Cocl2+KUrA8taoMBTytPCSvbAHLSEuPKveiO2DyDfLLU9nOGw9jSfRrVJoPg+
         xZY3/BuAHhdUIAxPuMR60ebuZH7Z6M7GggjEsOz3oPVooXm2KaCFmOuSGSHkwxdj6LTb
         cdJRjiEwK0U+qhC4mnpeYvV77m7slYgyC3f6Fh0x5dy2pTvwn2mPF5qzGbxEhAI/+p0x
         sRq4JIo+7josfUebM4ZrMV17TP27TVBfJB/u5cxE5NWQeHkzJN1OuXtOdLkAhEfs2OR6
         DR4nTnPGZp/iBTXPaLlo+7VDsGpWK7IDIjEWznObz/bKEWW8fkUsn4175BWi8oz9EN6J
         Mmfg==
X-Gm-Message-State: APuU4Z/ks/+svyPC047tE/YktaFgZ+HnbgneInv+cn8vYbMzkfEVpoY3
	YyHMmsSLyhaShyyOSmsZMHFkOFjzr9AmL9RGnfZerngjndlXMU6p2e/5
X-Gm-Gg: AYBFou2mnowxhSqtZ7hlFZBqVaSdZliwvgPBO7baHE7N3FWpuYsSzg873cBN39Tmwih
	L/+OM9kR9Nv4pCx7A4/Ds4jvKPeBCunQUr1yylTxQzyt0YwZfutKHdPAcI+Wc4YoTWea6b/HvBd
	VmGq2dkcdUVmcArpMj/fBZWikT0rvLaitch/fcACDakmA3b+UTZn+YVeV5PGa4fFmASs4uvm+Qb
	JR1ZVNviYBUbkQYHseEgtwZ0VHPtEKcb++2Y+VuFZ89FnZY29Zb2p/MRSw8EDxZPhSk40SB0YV1
	xjHKsBdmeiHnoExJefYW2xBGVGwTz7ugYYvRwW58l7ufKU9rB1uf0nbtN+ADbahpS709SgLh+kt
	Nqjdm+ZZQMDzycUHn5FSX22wQ472VzfCI6m6+NHjQFV6pIBnJCXRS+xt8ocHIav23O92K80+epY
	VXgRKyynuRDWRBEjFgAy0gNjF8hNLZx73YKwdNSWktEZs2mUUfhQbDXQwCrjRhQzI5Y7sFJ3eud
	LdXL99navGyCYGQY5FiBGBINsK1zs6/+1hiQb6vsxfQcbwsFSIlASbFNsH7Y/ELAEP5J9VFUkZB
	VhiVe3CR+Ye8zgjWr+oAwjNonvkAeaKA02C8XvEhwk7bBd795RCO1b1urpD8H5sP7UbqJkbmQZE
	6FW2ffCEqUS8gbuLKMByDpNLOheFmDp6qcuvxGPwbE0H103DMpbY1gRe/7ipBiHbBWULG0sXuok
	Xq18pH4do3nxsUbrbL0U+VRK7ZxqCx7FhdvoBFiXTh3CZNfWaCUPSK
X-Received: by 2002:a05:6820:c2d2:20b0:710:8db7:5f55 with SMTP id 006d021491bc7-71ab5189d19mr1680316eaf.71.1794600151240;
        Fri, 13 Nov 2026 12:02:31 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm2426192eaf.12.2026.11.13.12.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:02:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 13:02:14 -0700
Subject: [PATCH b4 1/5] send: report partially refused SMTP deliveries
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
Message-Id: <20261113-submit-b4-send-resume-v1-v1-1-af325aad1179@gmail.com>
References: <20261113-submit-b4-send-resume-v1-v1-0-af325aad1179@gmail.com>
In-Reply-To: <20261113-submit-b4-send-resume-v1-v1-0-af325aad1179@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Gabriel Goller <g.goller@proxmox.com>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

SMTP.sendmail() raises an exception when all recipients are rejected, but
returns a dictionary when only some recipients are refused. Ignoring that
return value counts the message as successfully sent and lets callers
record a successful submission despite the missing recipients.

Report partial refusals and stop sending the batch instead of returning
success. Add a regression test with one accepted and one refused recipient.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 src/b4/__init__.py         |  8 ++++++--
 src/tests/test___init__.py | 27 +++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 704ddec..a89d260 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -6634,9 +6634,13 @@ def send_mail(
             bdata = re.sub(rb'\r\n|\n|\r(?!\n)', b'\r\n', bdata)
             logger.info('  %s', lsubject.full_subject)
             if reflect:
-                conn.sendmail(fromaddr, [envpair[1]], bdata)
+                refused = conn.sendmail(fromaddr, [envpair[1]], bdata)
             else:
-                conn.sendmail(fromaddr, list(destaddrs), bdata)
+                refused = conn.sendmail(fromaddr, list(destaddrs), bdata)
+            if refused:
+                raise RuntimeError(
+                    'SMTP refused recipients: ' + ', '.join(sorted(refused))
+                )
             sent += 1
 
     return sent
diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index 764829d..397b635 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -2302,6 +2302,33 @@ def _plain_msg(subject: str) -> email.message.EmailMessage:
     return msg
 
 
+def test_send_mail_reports_partial_recipient_refusal() -> None:
+    calls: List[List[str]] = []
+
+    class PartiallyRefusingSMTP:
+        def sendmail(
+            self, fromaddr: str, destaddrs: List[str], bdata: bytes
+        ) -> Dict[str, Tuple[int, bytes]]:
+            calls.append(destaddrs)
+            return {'bob@example.org': (450, b'try later')}
+
+    msg = _plain_msg('one')
+    msg['Cc'] = 'list@example.org'
+    smtp = PartiallyRefusingSMTP()
+
+    def connect() -> Any:
+        return smtp
+
+    with pytest.raises(RuntimeError, match='SMTP refused recipients: bob@example.org'):
+        b4.send_mail(
+            b4.SMTPConnector(connect),
+            [msg, _plain_msg('two')],
+            fromaddr='alice@example.org',
+        )
+    assert len(calls) == 1
+    assert set(calls[0]) == {'bob@example.org', 'list@example.org'}
+
+
 class _FakeSMTP:
     """Just enough of smtplib.SMTP to satisfy send_mail()."""
 

-- 
2.53.0

