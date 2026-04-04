Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3171145355
	for <tools@linux.kernel.org>; Sat,  4 Apr 2026 13:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775309435; cv=pass; b=LaPFD6ZG63/R+IUi8gt1b2PCfRcXJ7OfjyOCXvB3ZTaI7S5Ow6015YFkZC5G3Oi5zUr3hFGGuaMSpVzYUrp6CfSQ0KJx/tYP6tTp3lM12veNSEL9vRDyNNf/gWHgAMeTB0v/NXIZ/95pavDUrNFJYxkMYJb5DrdAAfwr3l1E9V0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775309435; c=relaxed/simple;
	bh=oEVSq1w9LVjhpP8C4jYSWt4SziG6fZSSpnyeTb6iVYk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To; b=XS2L/+g9rlDvgkxSE2njZz054R3HKg3lvY4RfU/uT3vvimrj1+aV5Fvesl1bs+XAkrDc/VJeHXmhVB/cAmgyqkQKHGYQphJXIirJhyNOqWk+HEkEhpWLjp+RCbEJVhu+0o+zVlbP4K61n19qt/nmDfQK7fUyDg3E9B6rWpqiLq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=MPPF4t9O; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="MPPF4t9O"
ARC-Seal: i=1; a=rsa-sha256; t=1775309430; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Tz+mDVAPYnDfY/wkUsefIJq2oITKd2dU/tmFzvk6to1Ubook70mjGmovwIxbIoy5XAMWWUrmUDxgx+0THSVNUqWNKh8uo0ufx4qOoPUL70KinAc9hRvIwF8iWKE2Cxs4+/xuAqlbFjdEyMyEu7W5A3xcM/GD3k/vvrMvf2YBe5Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775309430; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oEVSq1w9LVjhpP8C4jYSWt4SziG6fZSSpnyeTb6iVYk=; 
	b=E5mXpH6XpCqoqNDkouXiHUX1+pv0Ejow8OGpFa4IVNm193apK8l1xyiwFhFVTQn/fNoetE9m5V5UsswF/LHzPEjQkgWTecCZ+aye1YBR16pgX2vI7R/IUgujGXNk3otissXZMFzK9iWxC2ZRcFCPq1NcwpEizRgWae3/KcQumVg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775309430;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Subject:Subject:Cc:Cc:From:From:To:To:Reply-To;
	bh=oEVSq1w9LVjhpP8C4jYSWt4SziG6fZSSpnyeTb6iVYk=;
	b=MPPF4t9OCTlFi5I6KUBCSC8/D/YHPEZ4UCfOK3qrGRw8Ya7VmV4u/fVaGruIA07B
	M60jNaHmOpT5PCiptMzt/3ltLIGTmH1YKI7sbGje8aX89mPtBQL0faPA7ZHBkptVbUO
	5oAOhILeRSkJY5LH10R8O7k+/4Mgzsfa0BIjEWAo=
Received: by mx.zohomail.com with SMTPS id 1775309427742650.8355070931102;
	Sat, 4 Apr 2026 06:30:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 09:30:24 -0400
Message-Id: <DHKEO2JM8PYB.3URB032516G9W@ritovision.com>
Subject: lore.kernel.org: request to update public-inbox for theme/a11y
 improvements
Cc: <helpdesk@kernel.org>, <konstantin@linuxfoundation.org>
From: "Rito Rhymes" <rito@ritovision.com>
To: <tools@linux.kernel.org>
X-Mailer: aerc 0.21.0
X-ZohoMailClient: External

Hi,

I=E2=80=99m writing to request an update of lore.kernel.org to the latest
upstream public-inbox revision.

While reviewing lore across browsers, I noticed that some input
controls can be hard to see or identify as interactive when
browser-default styling varies, especially in Chrome dark mode and
Safari on iOS in light mode.

Eric and I addressed this upstream by applying explicit background
colors to the relevant inputs in both dark and light themes,
improving contrast and making the controls render more consistently
across browsers.

Since those changes are now upstream, it would be great if lore
could be updated to include them.

Thanks,
Rito
