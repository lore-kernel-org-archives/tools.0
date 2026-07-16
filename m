Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9314424D64
	for <tools@linux.kernel.org>; Thu, 16 Jul 2026 13:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784209971; cv=pass; b=uqmf6Qfl7f1qSg0kQNE3jotCPGAPt5DKSGzoFDmeXTGdW96kH3OmAtFFndZ4FsTzNojCn/8mUgCw7U+DP9HHZLyNjU4upF1dIM47pEiRhZ9t/Dd/ZYdQWNDmtAH+LGFkjWAjX8qFPHmCJV8aX+prx7Lk4s1VWlIuzhITQyln5Tw=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784209971; c=relaxed/simple;
	bh=xJ4ohj/b49WleDB3SbDOo3HMqixMOIYVJK4vWA6TqIg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=jHA7Fy31zd8zD1H9DgHYmYwGxFu2cmC7HbKBCbsTcTRehuOjIS0HAV1zcYhhr/2PrctSGTTAdgfCj1EyfwrwSV2Kq/7iKe/OH96J+Br3p1zT0hy6MD7JXbAb5G+jjInNxBUuw/18yMxv5/2EnpY0Zy3wNwpSUd5sr+N6FhHZM+I=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=G0VCxOk8; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="G0VCxOk8"
Received: by smtp.kernel.org (Postfix)
	id CB7251F00ACA; Thu, 16 Jul 2026 13:52:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.15
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1784209967;
	b=SVr8STiw7j/jv3g2USFMvCFmKPDEPyAbqWPrGyCRDEA9p60QyH8A3bagjX4X0+XQ1nXl
	 uscK5dT9RcbzLHk8H0qnOjbJaE2SexHtn6nBKyGv4qzC2Wru2sIW9XhPx0tRmSKglmlhI
	 9iw+PkqyQgjH7l9ddOK1I7nMpLFWwFLQdTUi0/AojC1DD5/DG8aAybfCUJ1fQlbqjAk3w
	 90GSkWSCr+7wgNOY6aTHtKhtoVHZ0MawOzGNgtAPHAQ3fuvKIYwGgimVsyHQgocLFf7e3
	 RIuzhO9Ghak78gwQ8dhLVEe/5B6hiDZhti9ozm3mFVeAwGzya/yvRt+HoUdHEHNgl7A==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1784209967;
	h=DMARC-Filter:DKIM-Signature:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:
	 From:To:X-Mailer:References:In-Reply-To:X-ZohoMailClient;
	bh=xJ4ohj/b49WleDB3SbDOo3HMqixMOIYVJK4vWA6TqIg=;
	b=WdDqnMj0I6iV8fDazi6IekQqP2/zISx3IX+pg0OITjp3yjL9OKGQkkqk3ivvz6yzALLJ
	 LZTfpDELBNsYSgetZqSP4cEilchVC+gp2fr5ZQ/6+ePTSbeov82pnY7YZI5Z6fiVaRrnA
	 8C9zowh3KQuWHvima/YD5JggUdL++dnQ8pO8tD4TfvowgNRk/Wxk5f7rWFxI9NQsNjKAJ
	 LRkDKsi1FQoyLZIftimqX2Q5PhG/1TbzefnQn/R/QgjSA7F4pc6Ll3KeAiR+lgzeFoHmo
	 vLopriXCUGEEIwB1HVoDsylbOME03Z+mcVCL6VcSJB9R6wCko0OBiCJi7t1P4Y4LUJA==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=ritovision.com header.i=rito@ritovision.com header.a=rsa-sha256 header.s=zmail header.b=G0VCxOk8;
	dmarc=pass header.from=ritovision.com;
	spf=pass smtp.mailfrom=ritovision.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.15
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2472B1F00AC4
	for <tools@kernel.org>; Thu, 16 Jul 2026 13:52:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ritovision.com header.i=rito@ritovision.com header.a=rsa-sha256 header.s=zmail header.b=G0VCxOk8
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 2472B1F00AC4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ritovision.com
ARC-Seal: i=1; a=rsa-sha256; t=1784209963; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nezRnssI0TgUcOGdJd2iFtIiZCnEi3vd2WPad3LyIato2fzZEj3MZog0HxA5Wwctko6k2O1Tmi+uxl1Cklirg+Ztd6XvYv5Y7CuOKNA9l+dKn4Jfy4pxROywuwzDdlLzweh6GZVVMF9Ivopu2Szr3ReXjOZ8qFY4pIcf297mXMc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784209963; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xJ4ohj/b49WleDB3SbDOo3HMqixMOIYVJK4vWA6TqIg=; 
	b=PhK6UEjHZfjQR10Tey5zf3WmbpxDNcZ5hGfJ8fb7sf7+KL7zi87c9se1lc1NTzrUVHPvt1Avvi4yjGtBt/k4Ojeq7pkMl1na1lqlT2c2FjtnqT70hmOk5lh4FYTEslr2pl5NBi4e5ZfuhRAGi+a098mHEFqCwhtbgUOVbrNJBKY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784209963;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Subject:Subject:Cc:Cc:From:From:To:To:In-Reply-To:Reply-To;
	bh=xJ4ohj/b49WleDB3SbDOo3HMqixMOIYVJK4vWA6TqIg=;
	b=G0VCxOk8FfKcmWO7a1MoekP0RmxzugMl3SBGDIvAhfL1lRbbGV0+No8eQjHaBnMj
	/gMNabG6/o9EI9u8+8dS7JvELT8cj/yZkkboSAg/LVsxiMJa05rrxvYMaLfuiCjDZvS
	aKTB0RetuDteAz9kLckpZ0Ao5e51dT8m9XTO29Bg=
Received: by mx.zohomail.com with SMTPS id 1784209960504920.1579179368971;
	Thu, 16 Jul 2026 06:52:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Jul 2026 09:52:37 -0400
Message-Id: <DK01N723EBPV.39P0HGY3FNQ4V@ritovision.com>
Subject: Re: [PATCH v1 0/6] Allow site layouts to render properly on mobile
 devices
Cc: <tools@kernel.org>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Rito Rhymes" <rito@ritovision.com>, "Konstantin Ryabitsev"
 <konstantin@linuxfoundation.org>
X-Mailer: aerc 0.21.0
References: <20260316180036.71949-1-rito@ritovision.com>
 <DHP4NMANLLWE.2IAG0KWI6ZY06@ritovision.com>
 <20260410-hulking-juicy-boa-daef75@lemur>
 <DIMK6QKSFZ06.1CO47QXMHEKQ6@ritovision.com>
In-Reply-To: <DIMK6QKSFZ06.1CO47QXMHEKQ6@ritovision.com>
X-ZohoMailClient: External

Hello,

Are we able to proceed with the review for this
kernel.org theme responsive patch series to render the=20
site properly on narrow viewports?

Rito
