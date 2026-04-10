Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E571E2614
	for <tools@linux.kernel.org>; Fri, 10 Apr 2026 02:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775788987; cv=pass; b=Fac1BiNewd/3GYyqU4CNc4ef5i4FZTCXQQbAe+RVoGda4Azi49V+XXGKVsULo1rDA9RSdbyCA8o3611g/9xDQgj7mjQRrBBbPGfwKt0/X9wAnt2oaOIvsaH56uVHhIYJDyEzJLym+ATDspaiuG1BPAA03a4SOP6+r0qxbboqXaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775788987; c=relaxed/simple;
	bh=bfObVD8mrW+KV4J48T48+smtUgbEvwsf0PDeVhMjv9E=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Subject:
	 In-Reply-To; b=CiGqcLSnyrL/rvsvCpgKw/47eHgJ/K+2UcZ8DCp+wdZNXGVWk+PV8CwFEIYI2OaJxaZ8MwNK2yGYYgdnVZJWMQXzR6nEwF7QJzPViFN1jLTrdWt8lruFkRyEvgakMFUlZudR0nKK59bSbdPvH8lBjbZwJRQSaaSg5+a0WjuZXTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=k56tmrWx; arc=pass smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="k56tmrWx"
Received: by smtp.kernel.org (Postfix)
	id B2DACC116C6; Fri, 10 Apr 2026 02:43:06 +0000 (UTC)
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 84ADEC4CEF7
	for <tools@kernel.org>; Fri, 10 Apr 2026 02:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 84ADEC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ritovision.com
ARC-Seal: i=1; a=rsa-sha256; t=1775788981; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bLBjZCfImp8XFblbXclclkJ3CwzlWMgEAz7ld3hYXG2ZqwxC+7udaxE/JmKNOLKQZ0V+jwGpQk5UuS6zuJu3iQHOCP2NJcvK47+OEjnztbkUXmZx6Bqm2WIjuJyE5MqfuxnYf5KK92vWOZqVUAylGZvN2AqTaimrCSZhrbplqGI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775788981; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=bfObVD8mrW+KV4J48T48+smtUgbEvwsf0PDeVhMjv9E=; 
	b=fZZm66AowXcYG7olZjRIys+fBURxWprvp2R/zdyMTqdcfYfUDGU3PsU+mwPvLK+J66TuozxKirlF60IZ/FNPZ1GhB7osCpMwBOFqjuF+t/68d0+xJkMDbmP/CsiTYeOOAMM1kccP+ihLBegvG8XxiVZeD4b/16bH+J/ZN2eOFqQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775788981;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:From:From:To:To:Subject:Subject:In-Reply-To:Reply-To:Cc;
	bh=bfObVD8mrW+KV4J48T48+smtUgbEvwsf0PDeVhMjv9E=;
	b=k56tmrWxynKS1ZBVZ39lvyssaAgr/2PPXxNfWBFHmyz3Uq3rfsKqPHg9zOT7GCxg
	RS6goPn+/mIfTF6g2j6H0QM15580JqxJ/tLPDfoWZ4q4Kj9Rn1Ta/HeVPq9Lu29Qg2/
	MBJ9CAu1xWyx8bT7hZvKZa3KOgB2xMmqHdMIBeGE=
Received: by mx.zohomail.com with SMTPS id 177578897962882.42798116993038;
	Thu, 9 Apr 2026 19:42:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Apr 2026 22:42:57 -0400
Message-Id: <DHP4NMANLLWE.2IAG0KWI6ZY06@ritovision.com>
From: "Rito Rhymes" <rito@ritovision.com>
To: <konstantin@linuxfoundation.org>, <tools@kernel.org>
Subject: Re: [PATCH v1 0/6] Allow site layouts to render properly on mobile
 devices
X-Mailer: aerc 0.21.0
In-Reply-To: <20260316180036.71949-1-rito@ritovision.com>
X-ZohoMailClient: External

Konstantin,

Following up on this patch since it has been about three weeks.

I=E2=80=99m checking in because the thread has been idle while review
activity has continued on other tools@kernel.org threads,
including some submitted after this one, and I want to
understand whether this series is still something you expect to
review. It addresses a broken mobile and small-screen desktop
experience in the kernel.org site theme, and I submitted it in
good faith through kernel.org=E2=80=99s publicly stated channel for
theme/CSS improvements, as described at:

kernel.org/cleanroom-styles.html
kernel.org/fifty-shades-of-tux.html

Based on CONTRIBUTIONS.md, this appears to be the right thread
for work like this, but it is not clear to me that it is
functioning that way in practice here. If there is some other
more active path for theme work, I=E2=80=99d appreciate a clear signal
on that. If this is simply not a direction you want to take, I=E2=80=99d
appreciate a clear signal on that as well so I can calibrate
accordingly.

Thanks,
Rito
