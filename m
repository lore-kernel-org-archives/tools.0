Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EBB370D6E
	for <tools@linux.kernel.org>; Fri, 11 Sep 2026 12:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131014; cv=pass; b=tvsu4AF8zp6koupJ4QvRzsJWDb8Zb/fn6Az15cywLRq7quY5w+59AXSzDruOtwJvlfxCFr4otwODE874dHEWKXbJnI1Dix91RW74EqNRGYswmCSDn9W5K2bC5G223hVvWosTyPjr348nSO1RWniD1JYpJnYjmBPYdt2U0T9F2iE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131014; c=relaxed/simple;
	bh=XovKVxu7QxR9dTIS5/iALTBzoZhualq85COhWt0c0V8=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hrcKkhGSt8llT/qYH692CsoBkJy99KENAkMrR5eImx4u48l36t+rzZ4zrsaAmki3HfWdbnBgK77PwiRyG4yhoCkX6sWt7dmMsewzQDTkIjpVV4gnDgxqqS/gPGVm49W7xVdeEelAcV5rp/8FkUSt35rJl89dCIOCKAjuU4ad1Fg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=vates.tech header.i=@vates.tech header.b=oltsLN6L; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vates.tech header.i=@vates.tech header.b="oltsLN6L"
Received: by smtp.kernel.org (Postfix)
	id 109781F00899; Fri, 11 Sep 2026 12:50:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.255.28.35
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1789131010;
	b=gSum6hsLxR2aPPGVqhwWP6M6PF0cmtWYz/1uEzJ5dZBmNQ0vApFCgFP4NmwU2ZZODVsw
	 cYjUOn5E3nSKSW/8tZ5SkvZjKjVAB70loMnuKeIQabNHxvMTYhubnmsSnV45c1Bsh/+56
	 9sbbe74AaRRqtNBw0S5Jm8kzk7FUj+JBmi2T4e+vUxuhRW/AxrMvIE19vpliPIjEBmsb6
	 bVcVbi+zRyD7OVP516TrfAqzJJ2neSd7EFPmfgZzmwP6zZCwQ62dVMVFR1gQJXFyneq+Q
	 nSARgXx49XYSSMA+i8+yXX3YOKaWpWya997FWVCkOklqPF4lrQIrhHS7coCzv4ZQb/A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789131010;
	h=DMARC-Filter:DKIM-Signature:Received:X-Zone-Loop:x-campaign-type:
	 x-transaction-id:x-swg-uid:X-Mailer:Message-ID:x-swg-bid:Feedback-ID:
	 x-campaign-id:x-client-id:X-Originating-IP:Received:From:To:Cc:
	 Subject:Date:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Bm-Milter-Handled:X-Bm-Transport-Timestamp;
	bh=Hzt5f/38yPuOqSO98/zAnziYA90B5Vj6mHtgMxjNdtk=;
	b=WlkR7UQgGvIDJWJdbrYma6LOF1hUELG4w0L8JcyeQKm90Fdlf/hl6rQq6YZjv+vcMoVO
	 aejUIyBe9+qHn3AeEXAaNCx5KbnKbRF/ljle1Z2VkMiTmy+P5Cj6X75kMgJMdVaVIq2n7
	 +aZY0G1wlbdo4CQ9pviZnV+4WoJ1AbYySMVR8s1562aswGbR94k4HVxQ6ftJJKsyRwyBE
	 ly5L3SFu0vUOtKcn7GwzBR7HvAEr5XpQ47oEaB7tquV0aTftOHfSMCb6EXNgDPNWOidAk
	 hhYev5jM2soqB0jhUfaeLjoTDxZonOlBDNBTDRYlmVahgJeR9fLdHz+J8xB1XCdNR6A==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=oltsLN6L;
	dmarc=pass header.from=vates.tech;
	spf=pass smtp.mailfrom=swg.vates.tech;
	arc=none smtp.remote-ip=185.255.28.35
Received: from prod-mta-13-02.swg-srv.net (prod-mta-13-02.swg-srv.net [185.255.28.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0B3DA1F000FF
	for <tools@kernel.org>; Fri, 11 Sep 2026 12:50:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=oltsLN6L
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 0B3DA1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=vates.tech
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=swg.vates.tech
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=Hzt5f/38yPuOqSO98/zAnziYA90B5Vj6mHtgMxjNdtk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=oltsLN6LwTPRcrSAs7L1sF1ZADU+8sOg6Kn57wdgh8Srr9N3n2X1gt2RUu5gdlaKDtXD9xw+c
 8ZX3nVXIUKvD84kHAuGq6C9WuuqMKfjwRL4Ngh/TWhogdRMUkRGzRsw+7SIePoUUxxCRBg0o1j9
 I8JF8Koz4fp9yW4ZDGFxzoGnyhKuBoeyBIp13qtKX4247yJ01EPo26RUhxcRsTLIIaAwN3aHyUF
 jFLo8eu3mVksy66Njcji77/Jofm/wgqr7pFeYp1fj2AbbzPBIZlKJmuubeM5YKG10v5CiteMMBQ
 SVKr2d3Mbh8AMEYJia5JQCWBlXdy8ikZIPvx3AKATNcQ==
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender: 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id 1a0908492ef000c4f3.001
 for <tools@kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 11 Sep 2026 12:50:02 +0000
X-Zone-Loop: 43f9ec2bcef78c9a9f510a018c28e75cc0ecf2938c77
x-campaign-type: default
x-transaction-id: 1be47f45-f6c2-4b66-871b-69c1441ed041
x-swg-uid: 01-1d8a53d5-a70e-436b-ad1f-cc6c13c2a670
X-Mailer: Sweego
Message-ID:
 <1789131002.8631fc262581453bbf619ec5b2062170.1a0908492ef000c4f3@vates.tech>
x-swg-bid: 1789131002.8631fc262581453bbf619ec5b2062170.1a0908492ef000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Received: from leducb.tail4c4a28.ts.net (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
	(Authenticated sender: baptiste.le-duc)
	by mail2.vates.fr (Postfix) with ESMTPSA id 0D3C581E1F;
	Fri, 11 Sep 2026 14:50:02 +0200 (CEST)
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: [b4 PATCH 1/3] config: deprecate unused b4.searchmask setting
Date: Fri, 11 Sep 2026 14:49:57 +0200
In-Reply-To: <1789130860.8631fc262581453bbf619ec5b2062170.1a09082676a000c4f3@vates.tech>
References: <1789130860.8631fc262581453bbf619ec5b2062170.1a09082676a000c4f3@vates.tech>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789130778; l=1752; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=XovKVxu7QxR9dTIS5/iALTBzoZhualq85COhWt0c0V8=; b=uMthDzIWX2sQ2WLu8BVD4eawsAxwZBZO5+0jelR7w/NcuWYgseU7WSvK5worUdEgCULdfsPkb tvbKI36NzgDBUcIWyzY5Ie3hPuVHGwYZKoCoEQ7pGMRqcwd2Fl9r3wq
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789131002125

Since db4cd69 ("Migrate lore access to liblore library"), search queries
run through liblore's LoreNode, which builds the query URL from the
server address in b4.midmask. get_pi_search_results() never looks at
b4.searchmask any more, so setting it has no effect and produces no
warning.

Drop the entry from DEFAULT_CONFIG and mark the setting deprecated in
the doc.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
 docs/config.rst    | 5 +++++
 src/b4/__init__.py | 1 -
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/docs/config.rst b/docs/config.rst
index 4dce689..83a81c9 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -135,6 +135,11 @@ These options control many of the core features of b4.
 
      Default: ``https://lore.kernel.org/all/?x=m&t=1&q=%s``
 
+     .. deprecated:: v0.16
+        This setting is ignored. Searches are performed by the ``liblore``
+        library, which builds the query URL from the server address in
+        :term:`b4.midmask`.
+
    :term:`b4.trailer-order`
      This lets you control the order of trailers that get added to your own
      custody section of the commit message. By default, b4 applies these
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index d140757..df20835 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -214,7 +214,6 @@ SCRATCH_GIT_OPTS: List[str] = [
 
 DEFAULT_CONFIG: ConfigDictT = {
     'midmask': LOREADDR + '/all/%s',
-    'searchmask': LOREADDR + '/all/?x=m&q=%s',
     'linkmask': LINKADDR + '/%s',
     # You can override the format for the Link: trailer, e.g.
     # if you would rather use the Message-Id trailer. It takes the

-- 
2.55.0

