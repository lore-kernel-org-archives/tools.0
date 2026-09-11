Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88F04772A5
	for <tools@linux.kernel.org>; Fri, 11 Sep 2026 12:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789130866; cv=pass; b=doyXKuGgWS521+tKjbWdTOf1qHTkm5xUlfN26VGgZAgTdNNgI957xcB1RUgcB9QUnzrF/lW4GBJjTM1lF/mzRnANjcB5b7xmB8Jw0BjGvB3ZsqRHpcraKAOpPUxRQv1y4siTDcEGKKzcrwgB/oEJldBw0KayzLW7mgJiYFPgFk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789130866; c=relaxed/simple;
	bh=AkK9lmiuKw0Y22pmQPzHngLEFbsHe0QYUFhUchhWiec=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=Xa5zkKKWkK1h49qKfIdODNgb1agQe/uP7n0vUg7gD+3dKlJ8cxNPDUphJ8Ev2+jZvqHqJHVPvI2u4V+SWVq+Lgr8kPruLrTgSBmJjdMC3e8sw5EJbUH6YDOmRX0yZYo9KZgkJaO+L0dqk50yK/Hz2BgcSNgdshlVvsMSTkFagkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=vates.tech header.i=@vates.tech header.b=i4vVNiDu; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vates.tech header.i=@vates.tech header.b="i4vVNiDu"
Received: by smtp.kernel.org (Postfix)
	id 966CB1F00893; Fri, 11 Sep 2026 12:47:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.255.28.18
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1789130863;
	b=ZeU0etiy4Ylc+lbw7TAgvLOFaPOKU4H1iegqOXVWKCcfbrKTw20jej06SS/ewZVSWURs
	 2WLvQJrUvAumRn1XlWpfByvKsPBFxKp4hbssy+joEeDXHCkTkCL9GnPmPikymOc6bjkXn
	 b+DvFQZxFD0tsH1cjia5S4RP7BEltc1KYnoDlkWQL42MH0xtJg0ce/UI09am8eGMpnSnH
	 h/5KqstS8SMXb+yN+4xuU1swxmbO3Qixb0w/6oOF8QEUxPqsuMuXvOJko1L25SUDbfT59
	 aXNxGoSEvg9HDReFfii0QMm8IFPslynHv4isvyA2+HynGVF/0GNHD7cP34XnQN4IEKw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789130863;
	h=DMARC-Filter:DKIM-Signature:Received:X-Zone-Loop:x-campaign-type:
	 x-transaction-id:x-swg-uid:X-Mailer:Message-ID:x-swg-bid:Feedback-ID:
	 x-campaign-id:x-client-id:X-Originating-IP:Received:From:To:Cc:
	 Subject:Date:MIME-Version:Content-Type:X-Change-ID:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Bm-Milter-Handled:X-Bm-Transport-Timestamp;
	bh=3wLrF/udBpkZFHorjKOeS95BOKSuuAIRBkBPMNcd58E=;
	b=sH5ITOzSfNA2fMoxJv3MamePll7yDYnkp7GdmpLy/IPDO6gKYEvaozWFeAVvis9StAm+
	 XPpbtI6VUMEejvRQdfsWKkj7ZOFiuj8XzbjakqPpQEc693sZJV+AcSWA8HCG4Vx60lskt
	 HqAAbVbPiw+FrRt3p46k49ul6U/AGCUM6NVG7biRz+MpnVfp/j+hFQk6CZezw1ndC4Lb+
	 sozgQuWEufjQW8U0/5gvxCGq3/F6pPB1fYR/hpY6lE4K3naKQIpRRAW2WcIIxLcqWj0qa
	 KvCZ/AowNjVn3zyPFWvdnR6GbIN6JCvaC58tkoDm/iSFgONnbzbg1o61XBdaryqCDEw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=i4vVNiDu;
	dmarc=pass header.from=vates.tech;
	spf=pass smtp.mailfrom=swg.vates.tech;
	arc=none smtp.remote-ip=185.255.28.18
Received: from prod-mta-13.swg-srv.net (prod-mta-13.swg-srv.net [185.255.28.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8D37B1F000FF
	for <tools@kernel.org>; Fri, 11 Sep 2026 12:47:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=i4vVNiDu
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8D37B1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=vates.tech
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=swg.vates.tech
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=3wLrF/udBpkZFHorjKOeS95BOKSuuAIRBkBPMNcd58E=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:feedback-id;
 b=i4vVNiDug21uAulLRnYqn+nGSrbn+r1MqZF7RKYQLkIO35sgPswLN6rQ3YsGWb9tdygb6O/ex
 vnYlkncwoXGYFrCbONRpCEzMlPRKWuYGE4PJhADvhqs0s7W7wjiiM5abSiIwJwZdf90ypGP3Z/O
 qaLvU4WvrUrczDGY9qZHhi2Irp1TLN0sA+Q31Ks3tvLy8bIus7irS2+NoxUN5G6H+o9kBXM3Dd3
 vwresbCg/9yaEWArSYOQk2pmZyYj8z3KcVXA2CucpsN56EOoATjRCYT1gppTxH8f2+UMdQ9FwEm
 2SxfRNUvKHvolDCZU5gXDGAzonwlgHK/Ye0FskZRQavQ==
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender: 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id 1a09082676a000c4f3.001
 for <tools@kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 11 Sep 2026 12:47:40 +0000
X-Zone-Loop: 7317995ca8e09cde1878d3e589165636a8e7c585b7c9
x-campaign-type: default
x-transaction-id: 3e364ed5-8df5-4cad-951d-0e2de758c1ba
x-swg-uid: 01-f228f345-07e6-42e9-8c65-7b3206b6531d
X-Mailer: Sweego
Message-ID:
 <1789130860.8631fc262581453bbf619ec5b2062170.1a09082676a000c4f3@vates.tech>
x-swg-bid: 1789130860.8631fc262581453bbf619ec5b2062170.1a09082676a000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Received: from leducb.tail4c4a28.ts.net (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
	(Authenticated sender: baptiste.le-duc)
	by mail2.vates.fr (Postfix) with ESMTPSA id C00A981E4A;
	Fri, 11 Sep 2026 14:47:39 +0200 (CEST)
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: [b4 PATCH 0/3] config: fix stale defaults left by the liblore migration
Date: Fri, 11 Sep 2026 14:47:27 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260911-fix-liblore-migration-0242bcf9f2d5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789130778; l=1270; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=AkK9lmiuKw0Y22pmQPzHngLEFbsHe0QYUFhUchhWiec=; b=I9tlpTQfqrw0mCJFlfTbyjT9o3p6pi68FOyb+WtJS0ztPpGKqqH8Nx1JtJuu3zkG82CDjs4mS QXe2vIw1VgwBtk1nuYm+NkcmJFcV/wTXIs3oGl2TB0/Tu8cuvVgBQSH
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789130859865

Since db4cd69 ("Migrate lore access to liblore library"), search queries
are built by liblore from the server address in b4.midmask, and nothing
reads b4.searchmask any more. Setting it has no effect, and b4 prints no
warning to say so.

The configuration doc drifted the same way: three documented defaults no
longer match DEFAULT_CONFIG so fix them.

This series:
    1: config: deprecate unused b4.searchmask setting
    2: docs: correct stale defaults in the configuration reference
    3: config: take get_lore_node() fallbacks from DEFAULT_CONFIG

No functional change beyond b4.searchmask no longer appearing in the
default config, which is already ignored.

Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Baptiste Le Duc (3):
      config: deprecate unused b4.searchmask setting
      docs: correct stale defaults in the configuration reference
      config: take get_lore_node() fallbacks from DEFAULT_CONFIG

 docs/config.rst    | 11 ++++++++---
 src/b4/__init__.py |  9 ++++-----
 2 files changed, 12 insertions(+), 8 deletions(-)
---
base-commit: db0b7456d0cd606f397e18fa0c589fc621fa57b5
change-id: 20260911-fix-liblore-migration-0242bcf9f2d5

Best regards,
--  
Baptiste Le Duc <baptiste.le-duc@vates.tech>

