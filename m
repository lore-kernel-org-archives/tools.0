Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA390261B92
	for <tools@linux.kernel.org>; Mon, 30 Mar 2026 02:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774836535; cv=pass; b=SHk8BPfs8XCU8sydtl8NFqLn5vOiJ82yObMU3MEBsadthAwhYZM+o5jxNbd5mCHY+NS4zHSFJI7uTt/Oid6clnXiV1O85YceqC23QGCWbea9JhjPU2ihlAzqnW/9KBQrdeO7eJ8tAggFRqX0OJTb6jLFRLlRek1z51yp2cRw/mM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774836535; c=relaxed/simple;
	bh=KnXiN7aIotSqBUYgqoHS9lcjTI3KKlL8U6wDYwUsjTQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 In-Reply-To:References; b=QI51JNFzpn+33sMtqKN8WMHj6FBbpO/y2OCoeCdKcanXPXS1O+de+B9VffDMItIahEUiDTfewN7BOx9mOdciifv8grAbKoRHoEVNsLgQIz8St8B8r3SX3kcPJRLDQt8Un45rSKnMrBnifafTWTN+WuB65vJafEt/xKMIrq0m/vI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=agpuXsmW; arc=pass smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="agpuXsmW"
Received: by smtp.kernel.org (Postfix)
	id AA9B6C19424; Mon, 30 Mar 2026 02:08:54 +0000 (UTC)
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 86CBDC116C6
	for <tools@kernel.org>; Mon, 30 Mar 2026 02:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 86CBDC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ritovision.com
ARC-Seal: i=1; a=rsa-sha256; t=1774836530; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=a4ONU0+t74Yu/RPjPUBNWfuhVIcis1GqzCkDPNTUxJH/MO0OnEAXVvhNj/2UzxI5CE7ivutmOltsDYfimbsr+Z++TvTko1uQ0aR2dYeGGEUP40Mior+9cG/ZZgANweR07Ho4Ro0XE5ZMPNBqvF4bE3q6+xu6AdyijhBxluZCndE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774836530; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KnXiN7aIotSqBUYgqoHS9lcjTI3KKlL8U6wDYwUsjTQ=; 
	b=igvEs7O51D2ycGAARS0bRxw3K2ofzv93cP0gG5FGEG6M4fvqaebnUrcIIiDYTkOsTo8670XuuTjidz81kkjT3GX2Bbb7HK5gtKg0dkflbx+DtIcxH8mQyAhHT7rzeLe1bkC/FaNN9Y31dJuKWWJIZx9OQE9E/xXytDDnOcXQS/4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774836530;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Subject:Subject:Cc:Cc:From:From:To:To:In-Reply-To:References:Reply-To;
	bh=KnXiN7aIotSqBUYgqoHS9lcjTI3KKlL8U6wDYwUsjTQ=;
	b=agpuXsmWWYwT+kyVn8Vu0SPGlAS6IMNAi8mw8UPiglH3V04n4PDXsx9qz1YfDmvt
	ZRndrWtOjz86EyPMjhr/kBsS8EtjJDP+uGB5PBwbyNx1NAZg6wSyukgjQ/sJNSdtwck
	AFqY64ZTlSTIAEsMI62nLHbdHWaJrAJdJ7l8nfbk=
Received: by mx.zohomail.com with SMTPS id 1774836526755802.8676505382308;
	Sun, 29 Mar 2026 19:08:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 29 Mar 2026 22:08:44 -0400
Message-Id: <DHFR1FA1ORCX.32ENKF1503HLK@ritovision.com>
Subject: Re: [PATCH v1 0/6] Allow site layouts to render properly on mobile
 devices
Cc: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
From: "Rito Rhymes" <rito@ritovision.com>
To: <tools@kernel.org>
X-Mailer: aerc 0.21.0
In-Reply-To: <20260316180036.71949-1-rito@ritovision.com>
References: <20260316180036.71949-1-rito@ritovision.com>
X-ZohoMailClient: External

Hi,

I wanted to follow up on this patch series and see whether there has
been any time to review it.

FWIW, I noticed that lore.kernel.org now has a viewport meta tag
and is fully mobile responsive. That appears to build on the
admin tag injection support I merged upstream to Public Inbox,
along with the text overflow fix. Glad to see it all come together.

Kernel.org is next with this series!

Thanks,
Rito
