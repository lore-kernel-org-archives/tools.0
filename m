Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C399F40757A
	for <tools@linux.kernel.org>; Tue, 19 May 2026 09:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184282; cv=pass; b=Xq2PIBAzfaAcKxHi3dh6sG8FszhYUUaz1C8hCJXHvCW2iHiu7YX+OicekNxI30L0hLcZf98+nhO4A2rZalef7bcLxUyzbKZcPJS0woHTS8z4Sxa0BMUCbmfTbmta5G6qob+a2kb90Jp5FIc/wWdKO8xzzQXSrCBKBsRYaBwPNnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184282; c=relaxed/simple;
	bh=FMWVDVROsFrgfM6hzX/CHBgP7/umYnnjp11Vuqb7Uq0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:From:To:Subject:
	 References:In-Reply-To; b=ZWla2lgSj+eZ9+CYmxzsImWYu7bmsUd8UDYOzXew9hQkNJruSGE39oovwLAA/gKazoi+zD0nrbpcMedsvXtshY7zoiSrDOxgW1MnrKXW0Odtl++SkHBUZONEhnJes2U1F8rer0xbDGBAc8znVq8Zsn19vMs23Qya4tYJB2ZGXdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=F7MhZMkj; arc=pass smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="F7MhZMkj"
Received: by smtp.kernel.org (Postfix)
	id 7562CC2BCC6; Tue, 19 May 2026 09:51:22 +0000 (UTC)
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4AD6DC2BCB3
	for <tools@kernel.org>; Tue, 19 May 2026 09:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4AD6DC2BCB3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ritovision.com
ARC-Seal: i=1; a=rsa-sha256; t=1779184277; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iSXgMXhk4g5gyZpobvA3uf9au2ab9QKuyaCvl5DOXyWuNtQnAxB2h/ZH/BD2A51XCvFPDtzk6qpR2aXIc6V7FAmNqurfdlepO58mP1OZDiCAvbOaZrh4Kb1qYrVgbNakJotNcQelHqUuveJdKjP13UWv5H77uR2h5aUnJ3Fim2M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779184277; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FMWVDVROsFrgfM6hzX/CHBgP7/umYnnjp11Vuqb7Uq0=; 
	b=AWgGskZJTxWGfevnau4gpsqjz5pKJsbfrUINzV68AK2q8ODB682LmS60S66pFDXzTUfSRRtVX6ZCkbwsjCIyWEj7temU3ggHxCiRINC8EZWTbj6UMJR/ytrGEasVzJ3CnQLxD3Jzvp8wDB1G1I5n58JHHIWjdaMPiI/Xo9/3wk8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779184277;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:From:From:To:To:Subject:Subject:References:In-Reply-To:Reply-To;
	bh=FMWVDVROsFrgfM6hzX/CHBgP7/umYnnjp11Vuqb7Uq0=;
	b=F7MhZMkjY4qABkI+JjAvlmsFM8/rnUTgDj8nGixmKeVelwJBci1YwbqEud5/mV2/
	Bj5YCBpEP5qrdaXzXw46VrBibKLOtTdPakZN6duKWgaHlbKfLBHL/cji+4v+Ad/B9b8
	yd1Yb5APEaejbBBU6lBhh92e1blstttLgGGq+6qU=
Received: by mx.zohomail.com with SMTPS id 1779184275069864.7399755497792;
	Tue, 19 May 2026 02:51:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 19 May 2026 05:51:11 -0400
Message-Id: <DIMK6QKSFZ06.1CO47QXMHEKQ6@ritovision.com>
Cc: <tools@kernel.org>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>, "Rito Rhymes"
 <rito@ritovision.com>
Subject: Re: [PATCH v1 0/6] Allow site layouts to render properly on mobile
 devices
X-Mailer: aerc 0.21.0
References: <20260316180036.71949-1-rito@ritovision.com>
 <DHP4NMANLLWE.2IAG0KWI6ZY06@ritovision.com>
 <20260410-hulking-juicy-boa-daef75@lemur>
In-Reply-To: <20260410-hulking-juicy-boa-daef75@lemur>
X-ZohoMailClient: External

Are we able to get this series moving, or should it be routed elsewhere?

I get how prioritization works here, and if I were in your shoes I'd be
focused on functional issues too, it makes sense. This series isn't the
same class of issue as the others on your queue, even though it does fix
the entire site's broken mobile layout in one swoop. At best, it's a
significant brand and UX problem; it's not preventing the website from
functioning, and nobody's going to stop using kernel.org because mobile
is broken.

But that's exactly the issue with it sitting in this channel. By that
prioritization bar, it will NEVER clear the threshold here over other
pending items, and we're over 2 months in with no movement. If website
theme edits aren't really in scope for this channel, I'd rather see them
routed somewhere they can actually be managed instead of being in limbo
here.

Review shouldn't take long. The code is clean, commits are logically
ordered, there's a live demo to test against, and this isn't my first
patch around here. Once it's done, the website can sit pretty for the
long haul.

Happy to walk through it if that helps.

Rito
