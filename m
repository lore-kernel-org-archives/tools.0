Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CA7492E26
	for <tools@linux.kernel.org>; Wed, 14 Oct 2026 20:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792009242; cv=pass; b=aOi+S0qr1kU8Avs1g5+UPnrAZG5kLt3oCTZpcryv+j4rIkBYTLoni/ARgRDF0XVKPuE0ll3mI/IpAecX+pJYK4PgJNAy0dhirstw1bajFU/E9K/U+wTnAs+CKhomkYC2cRhcG1FpGQn0SZNQlXtNuzhHW+FeZdveLhgSGDvOztM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792009242; c=relaxed/simple;
	bh=aTdNjFQpJCVQ5WSXqjszskhAQeCnMWRo8h593+GAcL8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eJE+tpfjwfjwbXSaQJX3Un3mLnVe+CRGHRHqvFCsXMLa4QEvyob9AaUAgz9W4wdKUv7cVl5TOrWh3Qm7bIkPdJgn834GmHYnMT3LHFz1iwq3LmvedMKilEyD/EbK/gicLuHyZyygV1iv2j1l8GQPfNVeGJkicw3hfQI5iX0aUvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=jetm.me header.i=@jetm.me header.b=pdUzljLM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lFT/C6tN; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jetm.me header.i=@jetm.me header.b="pdUzljLM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lFT/C6tN"
Received: by smtp.kernel.org (Postfix)
	id E8C651F000C6; Wed, 14 Oct 2026 20:20:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=202.12.124.149
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792009240;
	b=FSP6XrzXtjMeJUE4fOFNXkQOgoO/GjHrxqWdJpZWJfNhuXaWsf9S9YuzL4EL7yP8Bv7x
	 xZALXauvWq+GQ8ADRnucr18ymFYHpUqvQvCVq9wjTzGkEfKM1smlKdUUN7I6t8J4EgS0A
	 lWhdPtHde77FjQnOR18u0e+PPivhMkbHmL+hxtobUf8l9L3nycV1YmPKudNidGS2ng1Wz
	 cACdjnW9tov0OFY0vmWhs4jMzt+Xtzd7lBNEnYpqCzGqKu5LhCC9RC2mpmGeA2yeoMFz8
	 Gpu/KFleUSsgup6fLqhGP+47T6x3kcN3W9SrBTNcJkQoEFb7+EpShP/4iMqCP91y1eQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792009240;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=34RZ41sG3aCpH249/pOoY5irgGEbYHjR1/2e4oZdppk=;
	b=jjpJ3QEIemH6hD4Myd9I1B8PVN5rbJP3ldq6R9baHit7AqX4RfIT4mFL7MDsmw8oojyr
	 Jy+GefHaxL6Q0VkOnpenokgcFZdciR7vbGTppt01z+fOZo2iYp+KtXAp0BL/wlLemk2f9
	 NCRgb5Y3mjak8ue/4LKZ0nbnaVGpiVE5AhcvsmGjoFBJ9eps12XTmzrsv4dIJXQKSatrU
	 0/n7ZZOKaprLB4ORgT5oFz4UVETTolRywqlRdNkWBraKttbDc/TWdpVbqCm/u4xgW1gIB
	 KTJWHYYI1ko2AZ7qaOtJ9E2uSOGZTtNC0UnPWasRH7MQl/UlDIlqnNamziH2BBKWjsw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=jetm.me header.i=@jetm.me header.a=rsa-sha256 header.s=fm1 header.b=pdUzljLM;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b="lFT/C6tN";
	dmarc=pass header.from=jetm.me;
	spf=pass smtp.mailfrom=jetm.me;
	arc=none smtp.remote-ip=202.12.124.149
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F32C81F000C4
	for <tools@kernel.org>; Wed, 14 Oct 2026 20:20:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jetm.me header.i=@jetm.me header.a=rsa-sha256 header.s=fm1 header.b=pdUzljLM;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=lFT/C6tN
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org F32C81F000C4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jetm.me
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=jetm.me
Received: from stl-compute-03.internal (stl-compute-03.internal [10.204.2.63])
	by mailfout.stl.internal (Postfix) with ESMTP id 5409B1D000A7
	for <tools@kernel.org>; Wed, 14 Oct 2026 16:20:39 -0400 (EDT)
Received: from stl-imap-04 ([10.204.2.95])
  by stl-compute-03.internal (MEProxy); Wed, 14 Oct 2026 16:20:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1792009239; x=1792095639; bh=34RZ41sG3a
	CpH249/pOoY5irgGEbYHjR1/2e4oZdppk=; b=pdUzljLMHjnol93Kgs0anxqprF
	8pDyViThVK3rhn5Zkyq1Wc2kM42AfpqUJkSEgr9LisRX/Vrr9qNvX+3W+gw/2Oho
	xvrSCfccFzzlRfdS+/I+yfh9hqWxro/rUqbf1J73NAgCeBUYVvHG0U4nak5SK1RA
	7SJZeCxI2+T4jiThvdMipRow98YWbD6VZ7ANxC4oDd/SozGekHGqMRKbUaX4Iv1U
	W1FS/3FjeS7U0OrJ+QR+rv2f5leq/DNoH4sfOQo6Q8eYmy4eckbGK8K58rCaDr4e
	R8sGOrESToQ9rXPPg7qbIKLxurEZE8A63kUVNlLiumcMDXBm7yPt4Val5u5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1792009239; x=1792095639; bh=34RZ41sG3aCpH249/pOoY5irgGEb
	YHjR1/2e4oZdppk=; b=lFT/C6tNGatY5JnWM8ipLt8isCkXwndnuRT3HR29VA9h
	rFD2Rq7QZKahVq5dRPcfQxfs4Y4MtQue0gI1AG+N8SRoM7sWxzllDFJoe/1sfp2j
	KE2PRn/oxLTMUtMlybktiCYowO9DRmlTB5q56fj1H5X3h/f3dhvd9vyypIV6nKyZ
	zNWZhcK7zJ3mNDwzuIdmKoTaS6hgTVDeEz+ZpNdfwmxQzxYhgH+CfFrfRaJj90H8
	wRgxP/trvj4eeA21K+yCbywqYMHSkM7PTETHKKwv3L/QVE9UGn5wr6bgmKPAtHSe
	OKpHKo7vDxwKlC/4geBl156kFQsjGbmkHyuJt1tPUw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=jetm.me a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792009239; d=jetm.me;
	mf=PGZsb3NzQGpldG0ubWU+; rt=PHRvb2xzQGtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:FFz1v9RrcUoGTCuEoW1zcX1IxXekft7e9rHnpm9vH2DIPHF
	nE9vfl+oD44Wmzj476VOQgTbu+KYBc5piskMcvgNx5RJ9bNQPy0MBMKPGo9SLmSl
	IDV1s2TdI0hQrCCvHuxTmdIIvsZkZHou4SitF7kNv3CmZG2s0Qbqm7ro92EtY1DS
	U+2ngcCYRldx8DCe6VecMPXzLcz36sE46w0JHKCuc3InsRXHH7OeWSSihR+RRA6n
	twtQx8JlY3/DS90FbZggeNOSyDmwYkTOHweJiFU5VeHdSCDXPOfS0gdx6Y/2mmZe
	aKVL8eXteAtRgttAdHZR+28tZQ9xbDO0lZPqC7w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:wfm9H5jqoctC8h6M91cPgLn/+BfJlwRlr4ucRp9RYRM=:aTdNjFQpJCVQ5WSXqjszskhAQeCnMWRo8h593+GAcL8=;
X-ME-Sender: <xms:FuTPai-Fey6Zf8gfTNY19ectCFcbN6Ydve2yyGy4f5zjpocH9LPBJw>
    <xme:FuTPatjCIilIkPg-iDoP2OQYlwlrdGrDqONaQjnW1VFjCKLv3OCRA-FYEwlsYre1F
    w6EbABvqRr93kZXf_2-hX8FJBNxqYp42bi0pFs0aGtCNt6X__Ffgl8>
X-ME-Proxy-Cause: dmFkZTF0FgvxfKsrb22vitjNQWXdx6Z7C+fOFEzGXwK9C9eBsUTq4vsrC4Vm/mtsF+NhSZ
    UmD6pcDkQP7zSmCkIvGAtA36c8/qBGWDnL49Fj5jtxxs/ERsnuSw4q6vTucijGfvrNvyPC
    nvq9I2OZymxETuq7/nfa+NzFuUcCPgzedeXFciLoKVQAicSxS7YJTCMG8lDGSFxjHZ3PsF
    ZI3nQpyxIjgUjhZkTEJGkMf6oZm8gkW+5eLBnO1vnTryiFGwX+bBfg/XElgHb4Om7IHFds
    dtd9PkDATABsJmzg7IoT76/enCt6AGSQIQyodQ74Nyi15Y4IphkdBhCEnAFsG8LvDY4Xl9
    vySndfsrGp+DH4Kyhxp7lXlpNMXzpmRGuC1VMpFBVTBXV06F5LtxvW3On7joaEPPF8/16v
    IZGFilxbrCgtLPsIONmSO042wDjE66n7kiFdCypSkPMlRmvZ/oWrzglmcM14/E9SjZ82ey
    DU6nnvXGrHTTA1OXewSYYVNrG99KJhJxy/isqX8ziMYK9hA2w4pLUyi7fIOgRr7hPO/GnF
    CnCPZ40LT0/DeFAqRELacrgXDkw6223H16ZLnCyNUG9SYMpoeHsb1VZ5NHRKhOLWvGk/gQ
    RIuVb9NF5BVrVgPKiEyjaBQlHmuWy9QykJLcZ6mZkQkA/hEqDjPagxtTnDwg
X-ME-Proxy: <xmx:FuTPau8TRmwu_ameybyp6FWyr-Yvf9A4vaLVUbjPg7kXj6Tm7x8N5w>
    <xmx:FuTPakvWporsdgEbmBgpYrssLuudnMQ56Lqn5A-KurPVu7dJKD95xg>
    <xmx:FuTPahqW_bjbVmFpUwWEJhLmR_LPbTi6xSH_Ain-st5JRHmdQf_Cbg>
    <xmx:FuTPahmOpqzyltMhB4NA5ypbBIj9d5IksvMkNM2LAVoreNJaX-2mXw>
    <xmx:F-TPanTT74Vcqb2CzFuRaRAqhjX9YDAtvCSqAfCNIQwgaYrRBw_OLB18>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id A28548006D; Wed, 14 Oct 2026 16:20:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Subject: [PATCH kgl 0/3] Recover from a crash-corrupted feed state file
 instead of crashing
Date: Wed, 14 Oct 2026 14:20:35 -0600
Message-Id: <20261014-fix-feed-state-corruption-v2-v1-0-41bb71ddc15a@jetm.me>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMywrCQAxFf6VkbWAeWMRfERfTaaZGpS3JtBRK/
 92oy3O55+ygJEwK12YHoZWVp9HAnxrIjzQOhNwbQ3Ch9c5HLLxhIepRa6qEeRJZ5moWrgG7VNp
 LdiXFcwRLzEL2/+Vv8BrecP+PunRPyvUbhuP4ADz/V/eFAAAA
X-Change-ID: 20261013-fix-feed-state-corruption-v2-baf68c0fa353
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4080; i=floss@jetm.me;
 h=from:subject:message-id; bh=aTdNjFQpJCVQ5WSXqjszskhAQeCnMWRo8h593+GAcL8=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBqz+QTEhKrk39htab29To5CCh/l6dQ/fuphQdPX
 Xy8+quQA5aJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCas/kEwAKCRC17sMLqGd3
 HwtZC/9cYSnW6LbQdwogbS5fgRKNi/Zo8qVuu55jwhqBTGu9+rYrjJuLe1fn7dFYZyfP3q2PTyv
 5xZKM3KwuhHHvbIws/IvqC4xh+c+VLdia0IR4lEN+PQ7ZSSTwy7jrLW6zJVPM2097LGUKQ+65xQ
 2wzx2hcb5ljtzxrgR9rYdHfK2p6LtP6xTepdbqELSIZEbfBHVQwPrskI2FUGPlNjpshDy0aOeHR
 isUi2SMK0vviZVBs/vgxEUaCqSZuBcSpVDRLRGuLecxWdxPOxJL0EMSugyEFu1JCwDSwVwX156n
 ALSVVMbSqWipHYe91SBU/PaxYP2hO5Jamwtc8hfSCcwCe+a2ezDOn8zIHkFAQ9Lr438zcWeTNc/
 bQJw5ho3b4CibXb8oNl9eC1vTK/emmSVS5sUubb/1EEL5C99ILCy3bsVIHzsS6tPIsuqrSSKaBF
 BqY6eZ68lStpOzO/TjoSgYu4iju51KorzXxrBmkfYdBuSL9p9qk1pPftVmGYwEF2fPZjg=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F

A host crash caught kgl pull mid-write and left one lei feed's
korgalore.feed as a zero-byte file. load_feed_state() has no handling
for that: it treats "file exists" as "file is readable", so the next
pull hit an unhandled JSONDecodeError and that one corrupted feed took
down the whole run, including every other, healthy feed.

update_feed() already has the right recovery for this - it catches
StateError and calls init_feed() to rebuild the state from the feed's
current git data. A corrupt file just never reached that path, because
load_feed_state() only raised StateError for a missing file. Patch 1
makes it raise the same error for a file that exists but can't be
parsed, decoded, or doesn't have the shape every caller assumes - and,
since save_feed_state() had the exact same unguarded read reachable
through that very recovery path, extracts the read-and-validate logic
both functions need into one helper rather than fixing only one of the
two call sites with the identical defect. It also distinguishes a
corrupt file from a missing one: a corrupt file's delivery pointer is
still valid, so recovery reports STATUS_UPDATED alongside
STATUS_INITIALIZED and runs this pull's deliveries against it, instead
of waiting for the feed's next change the way a genuinely new feed
has to.

Patch 2 addresses the other side: _atomic_write() renames a temp file
over the target, which is correct for atomicity but says nothing about
durability - the write and the rename can both still be sitting
unflushed in the page cache when a crash drops them, leaving a file at
the final name that reads back empty. Fsyncing the temp file before
the rename closes that gap. The directory entry also needs fsyncing so
the rename itself is durable, but that step runs after the main
write/rename, logging rather than raising on failure - a caller like
mark_successful_delivery() treats any exception from this function as
"retry this", and raising over a directory-fsync failure once the
rename has already landed would make such a caller re-deliver a
message that already went out.

Patch 3 closes the same gap in a second local state file,
epochs.json, that LoreFeed keeps alongside korgalore.feed. It has no
guard at all: it's written with a plain open('w') + json.dump() with
no atomic rename to make durable in the first place, and read back
with a bare json.load() that update_all_feeds()'s exception handling
doesn't catch - a torn epochs.json is the same crash-the-whole-pull
failure patches 1 and 2 fix, through a file neither one touches, and
one that's rewritten on every update rather than only when something
changes.

Confirmed the original failure against pristine master (an empty
korgalore.feed raises an unhandled JSONDecodeError), then confirmed
all three patches fix it end to end through update_feed() itself, not
just the lower-level read functions in isolation - a test only
covering those would pass even if save_feed_state() still crashed one
frame into the recovery it's supposed to prove, or if update_feed()
still reported the wrong status for a corrupt file it had just
recovered from. Full test suite (1138 tests) plus ruff, ty, mypy and
pyright all pass on top of each commit individually.

Signed-off-by: Javier Tia <floss@jetm.me>
---
Javier Tia (3):
      Treat a corrupt feed state file the same as a missing one
      Make _atomic_write durable across a crash
      Recover from a crash-corrupted epochs.json instead of crashing

 src/korgalore/__init__.py       |   8 ++
 src/korgalore/lei_feed.py       |  22 +++-
 src/korgalore/lore_feed.py      |  46 ++++++--
 src/korgalore/pi_feed.py        |  75 +++++++++++--
 tests/test_lore_epochs_state.py | 118 ++++++++++++++++++++
 tests/test_pi_feed.py           | 237 +++++++++++++++++++++++++++++++++++++++-
 6 files changed, 483 insertions(+), 23 deletions(-)
---
base-commit: ea22e7c8701e566328f197c748718cd689f9ea28
change-id: 20261013-fix-feed-state-corruption-v2-baf68c0fa353

Best regards,
--  
Javier Tia <floss@jetm.me>

