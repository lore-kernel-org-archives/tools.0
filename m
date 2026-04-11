Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4481DD0EF
	for <tools@linux.kernel.org>; Sat, 11 Apr 2026 13:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775913190; cv=pass; b=Xrsfs9Ena94sRGuxQzkDGeQLNl5oMbiib5ukY4bDQCdLDxe3lY0I/27KwPYxjMGSBHrABQQNUNV/13h+iPzstkwJvXfWP7RiPHOwFuk8y7iyoecGYH49raNxrGg6nxSkok4sQUEYDqUQhSBXYsQ/iigpHLUTr41URugtcxE4r8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775913190; c=relaxed/simple;
	bh=81d6Isk1n/HCQrR47WCk6y1C++qnngju5IZ84AedRo0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:From:To:Subject:
	 References:In-Reply-To; b=Qt599FKWgxbAFNK9HuNB5+X1e3Oz1Srng+VfkEjsl6CEVqlAe9yIsfMG8VFVTSzmt+N+F8v1EvJ1zMcCN6ZJoLH/yFgkeirMMaX9rhr5+SS4nuKxIjV5OneCLWkahZDNnZCAFhEXnAJkOhiay74cMyywLYiewPuBiwyGTJlc2bE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=LCnx58tx; arc=pass smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="LCnx58tx"
Received: by smtp.kernel.org (Postfix)
	id 2FA48C2BC9E; Sat, 11 Apr 2026 13:13:10 +0000 (UTC)
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 319C4C4CEF7
	for <tools@kernel.org>; Sat, 11 Apr 2026 13:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 319C4C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ritovision.com
ARC-Seal: i=1; a=rsa-sha256; t=1775913171; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZwluQAr5jMlMRAw2ok86EOqVXs58LDaNTM1N0wxRzqdEyahFoTvHXVm1Z0cgw30P8lGgXfY9CQHWtJSTQ66JdhEXRKAxe3WNjzw6XomRI4/K2kCyxhkPpRDc7rr+yBbdxOvlJf7UxdmfcLRIzOhCyOSXAKMak+eUnOMptw7/WRg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775913171; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=81d6Isk1n/HCQrR47WCk6y1C++qnngju5IZ84AedRo0=; 
	b=UAYUVsDtji+8NIbrUHmCpydqTr4oj9Br5VaP+/hnoHMS2qd3GoUmvN6bIDTSk3bXoDBhciiE5s4IqaoSvi34lu6Z88PlZ1wSoVgk8N8NqCE7N8/Qh88KiJGsQyO3duxZKxXk2HaFmLNYQCDNvWb7bU0jW3Dclw3PDrjV+8LMnb4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775913171;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:From:From:To:To:Subject:Subject:References:In-Reply-To:Reply-To;
	bh=81d6Isk1n/HCQrR47WCk6y1C++qnngju5IZ84AedRo0=;
	b=LCnx58txhS+56tBseigA9SgoHydYA1N+DbdEFeAHfrlf2B30nxEpGGnrcYwyvkFX
	kVdjOmCICviXjeXaXYaQsmD2tZTFE/GQezGcAv9JXifizmc1/+V/FOpsGarabRkIHvp
	FFjrBTbhK+MFfEqX1pd4nGAyFp02RrK+vw1z2+uA=
Received: by mx.zohomail.com with SMTPS id 177591316853834.42635244769349;
	Sat, 11 Apr 2026 06:12:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 11 Apr 2026 09:12:45 -0400
Message-Id: <DHQCODGCPETY.7ZD0U9Q9TIJ2@ritovision.com>
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

I understand.

Thanks for the update.

Rito
