Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFF83D88F6
	for <tools@linux.kernel.org>; Mon, 16 Mar 2026 18:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773685086; cv=pass; b=Y05FDSBpg1TDhE3c3OfpyVbHBAV4XWVJjyObgIzngxJ6vXCEKWgsq0McvKJZwDiR2vZg39uSDkpZ877iXR/aIyCe+l4dO3ChyLnbJFnZ8EXjMZhFETagvE1CA7j6+9sVCO+P3Qsg+MEHejCMYrG1TB7sRIayOZLTMVbgDSmN25o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773685086; c=relaxed/simple;
	bh=d2PTXArNM7fZe7wpr9CU88axHqcZvUTIZRzi/bqrsz0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=p+mXDLnS8AXqKLoVJ+u98KeSrvT6efEuHaZy/KkSSLIRZZP9VbQKBdishVyfm6VlDVX59NFMktnr4CQOsp/eC3wd4FoJJtTo/ScUvn2R4hcs5EoxpGyvGZct0HStt0Z3aeZKO2iCpBbMT3D/drTPgpJCCvN3nTJmOnZApW5AO50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=U8MGcSxD; arc=pass smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="U8MGcSxD"
Received: by smtp.kernel.org (Postfix)
	id 9C333C2BC9E; Mon, 16 Mar 2026 18:18:05 +0000 (UTC)
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 894ECC19421
	for <tools@kernel.org>; Mon, 16 Mar 2026 18:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 894ECC19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ritovision.com
ARC-Seal: i=1; a=rsa-sha256; t=1773685081; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DvIbqxEfz3QjiedbXwmeK9GPLEfXSwCvm20NIvtUgKTYh9F+/vEPLWrbZ0DYoG415h9CXeS/xumalEfU/hlaOsqDUV1i7mAs4ZJeLTwrLXYbKja4utvn3AP2W/3HjHb/sPR0dg5fGs96kCO9p2c+poe8no9yjimeFur+CzhqVEw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773685081; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=MQI7cFh8Wo8JdJN1fE2mZlN15LuHQadP3uGB1cQ28vY=; 
	b=Q8kFOrJN8gifBQiAkqB6BKvKONN2fiXuKMVu1YIG5ccL7dQOPd3f9yFsGBW+E+zMu6qDekfiNjewdWu5JGn3Q0iHb+ZKC+HjRCUx351XB3ylxNZVekxGrv521WbYKtIPd9114Amp2KEQSVl5zSu9NmIDvlkk7SSYZakNHKFGBgg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773685081;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Subject:Subject:From:From:To:To:References:In-Reply-To:Reply-To:Cc;
	bh=MQI7cFh8Wo8JdJN1fE2mZlN15LuHQadP3uGB1cQ28vY=;
	b=U8MGcSxDuDlRf5d2ZBeE3SkUeCBQFlbjCevpEQZcNQb89N7Lv7l6S/DGa6Fylwlz
	VViXgdyXB1ycbk5xOHsE7czZkvmIFPOfNDHToLj1sZitqV2gR/ETokXZRUibCVxFvte
	wqZ5BjjE/cb5z1zgYLHiIBVSVpdmjIBq+uVqVuVE=
Received: by mx.zohomail.com with SMTPS id 1773685078648215.15923407780429;
	Mon, 16 Mar 2026 11:17:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Mar 2026 14:17:56 -0400
Message-Id: <DH4EVVGAKR15.1KVL1RYGQCI67@ritovision.com>
Subject: Re: [PATCH v1 0/6] Allow site layouts to render properly on mobile
 devices
From: "Rito Rhymes" <rito@ritovision.com>
To: "Rito Rhymes" <rito@ritovision.com>, <tools@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260316180036.71949-1-rito@ritovision.com>
In-Reply-To: <20260316180036.71949-1-rito@ritovision.com>
X-ZohoMailClient: External

Also, I have a live demo of the rendered result here:

https://kernel.ritovision.com

For transparency, the demo includes two elements beyond the exact
patchset as sent:

1. a static recreation of the homepage releases table to demonstrate
   the CSS changes to it, since unofficial builds / dry runs do not
   include the live one

2. a mobile menu drawer UI that is a follow-on patch and not part
   of this series
