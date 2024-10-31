Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B731C2456
	for <tools@linux.kernel.org>; Thu, 31 Oct 2024 18:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730398312; cv=none; b=u7bzvPTlc3jJOf6YDBECOoNsiM14erZng0hM2lGbE4yRh10l1BK1j+PeXkTYsASBGPAjN3u08BefFsdX5U6JNIAr/wzDKBsm2kxOu73dCT1cA9fz1h/Bn9wmLob9Ugo819y/lpIn3DpGmPZEJ6pLkG1RWwSn+Na6Whwsqgkb4QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730398312; c=relaxed/simple;
	bh=Den2+w/sUMyzudaXVQsjBfxIyV+Zd2sncOfgTx4XWTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k814DXfOU0R2rvtsbdpa1eps0HiRzl1s0oH0EJuXsgaxXX/lVw/SQu1LJCtGNj759QqsGzH+F2mFG1AtBAOQghGp+m53UV+8qTNAzCD/Sd3+u4rtxi+fsvHoPTM8NQfBVShPIzT5bO9YYvEeVbWhXk5s3cruslmA+cYQao/Urd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TFPfgaYF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TFPfgaYF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A246C4CEC3;
	Thu, 31 Oct 2024 18:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730398311;
	bh=Den2+w/sUMyzudaXVQsjBfxIyV+Zd2sncOfgTx4XWTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TFPfgaYFQdUjP/vFOYKzHzrEe/C4BoKZY5zbWcCmeK3GGaqQTJDmVcNhx6Yhn3kyP
	 XiPM3oKlL9LKYIByTlz9M9QyOwsgACmHghDvUiCPo/zoMlE5nqmoFuwqzvvXS9JFZ7
	 N/Vzg7UJG9mqmYYymH2IpNYP1spFBcHPAyCP3clg=
Date: Thu, 31 Oct 2024 14:11:47 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Ricardo Ribalda <ribalda@google.com>, tools@linux.kernel.org
Subject: Re: Bug in b4 shazam?
Message-ID: <20241031-unselfish-hare-of-cookies-5bb18f@lemur>
References: <CANiDSCvSAVkSsdWzfGFHK2YZXy_dOHVeJOA7V0pmyzHzSm6iEw@mail.gmail.com>
 <20241031-rich-caribou-of-superiority-61f832@lemur>
 <50a4abd8-eee7-400b-843b-24e0aca4a63e@xs4all.nl>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <50a4abd8-eee7-400b-843b-24e0aca4a63e@xs4all.nl>

On Thu, Oct 31, 2024 at 05:59:52PM +0100, Hans Verkuil wrote:
> However, the patch itself as formatted by 'git format-patch' *also* has no spaces.
> I've attached the git format-patch output to this email.

OK, I see -- using "git show --format=email" definitely shows me the spaces.

bugspray track

-K
