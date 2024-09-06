Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBA11D27B0
	for <tools@linux.kernel.org>; Fri,  6 Sep 2024 14:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725634037; cv=none; b=gvfisSkm+wuqyMh6J6vUOZ6DoPUGryLOotqIBbvSv0SNjKtjg7oV5RcSTmSZPFqISR3yLXZwjrpvNwOS20X6DsItqgQdthH0mEdPMhDKC1Xvw1J/lo5W9XfOiSR5UdF20qzTJCaC4Cg614NS623IK+EbHDmqU9aecBi9/5GJISg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725634037; c=relaxed/simple;
	bh=QndItIQWYS7y1FTAzYlUMBoI5HSGTKU+FwxM54FSly8=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MWP2zX6Vsgf8RteZwPqvAu0S7hR2cp27mhzlCtchGGKr2ic096Ui/L1S6sw++fhx3+hZo2lxuwbu6U6PFNIYKbJ0g6p/wQo9LCEnUaZh8RcIbyBwGZwbBNoGxNCurc01+nYDVPauTYfmovj9k3TB9BzclrHtUSblQtr5dUj8UC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ueR8kV70; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ueR8kV70"
Received: by smtp.kernel.org (Postfix)
	id DB4E4C4CEC4; Fri,  6 Sep 2024 14:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C79C4CECE;
	Fri,  6 Sep 2024 14:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725634036;
	bh=QndItIQWYS7y1FTAzYlUMBoI5HSGTKU+FwxM54FSly8=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=ueR8kV70je2DJRJxYOo9MiQFTBEycPFLY989wp1yvsNnzU/xwa5Uv2o2VFxS4DBgt
	 yNdCqziMMBqUP/hJ8LZFd1Hpj18J9usaheF8TwmY6SJfaMC01vdV6IBwYc6noEpf3P
	 Yrj1H13IGkyBO/+NQEoZNj9pTTYN4JnGBTwUwheU=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
In-Reply-To: <20240817-selector-doc-v1-1-7c5c824a4e9d@skole.hr>
References: <20240817-selector-doc-v1-1-7c5c824a4e9d@skole.hr>
Subject: Re: [PATCH b4] Document patatt key selector
Message-Id: <172563403652.23316.3820888378825682989.b4-ty@linuxfoundation.org>
Date: Fri, 06 Sep 2024 10:47:16 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-40f6e


On Sat, 17 Aug 2024 10:00:53 +0200, Duje Mihanović wrote:
> This selector can be used to authorize multiple keys for one email
> address, but hasn't been documented anywhere as far as I can tell.
> 
> 

Applied, thanks!

[1/1] Document patatt key selector
      commit: 4c8d3ce60abaaf81b29c58f6ed77cccaafbe33e0

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

