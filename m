Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9984523E35F
	for <tools@linux.kernel.org>; Fri, 20 Mar 2026 20:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774038116; cv=none; b=oi6i17MfcnibDJT8esZx2CKdmg2nZKM+z8Ni+4H4SctjWp2SXs1GYCI6N7XjyvOl8zkK4m81h75Ak03CeLed2z7QkUowLz/FT5Qz/47nQeF2XfAqJlzjH0LpTu3IMhzFdaHM1IfoOazRbA4oBd1z+x/Lm2ijEStbsRH010eI/Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774038116; c=relaxed/simple;
	bh=eMdlLTPJeoKVtGJ9fSc4EMD7tohJnnW+lgdLFHwY9q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TauQqvWz58M0h5MrAVRDOypnngp4Y4CpYUpR8sLrr7ztN8EwTifhg4cPlltZrCi5WIse8D29lldnzyftYidpQGH5n1rUt4u+pY46kD7oD8h9SR1i1VPTjKTkaWcMkXln9lpNXs/owWWrHe9KfMMUElWujnyTuVT+gXvqAqHNv8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BwqNrPUb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BwqNrPUb"
Received: by smtp.kernel.org (Postfix)
	id 42BDCC2BC87; Fri, 20 Mar 2026 20:21:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA1C5C4CEF7;
	Fri, 20 Mar 2026 20:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774038116;
	bh=eMdlLTPJeoKVtGJ9fSc4EMD7tohJnnW+lgdLFHwY9q8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BwqNrPUbh6Xts41TgCJKrQv3IOkrK3oIzPf2o0OjZrsruBvq7giFsuu7PHgMm3Rf8
	 wythMNpLfp30nNywJ8yfJNa+Pn5i4XZWGW7QMjZLA1LwOBKCszfJlkBiqC5wDN1YWb
	 CeUk60+eVShAkwYGpigJ9/slPrlann5qGXeHT3E4=
Date: Fri, 20 Mar 2026 16:21:52 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Dave Marquardt <davemarq@linux.ibm.com>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4] prep: Make `b4 prep --edit-cover` remove already_ran
 file under $GIT_DIR
Message-ID: <20260320-ambrosial-strange-sidewinder-60216e@lemur>
References: <20260320-fix-edit-cover-with-workspace-v1-1-6023305b0f93@linux.ibm.com>
 <20260320-ambitious-hoatzin-of-argument-0b1d72@lemur>
 <87a4w2cl3i.fsf@linux.ibm.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87a4w2cl3i.fsf@linux.ibm.com>

On Fri, Mar 20, 2026 at 03:16:49PM -0500, Dave Marquardt wrote:
> > I wonder how this happened? Is the content below '---' just the cover letter
> > and the commit itself is without any message?
> 
> I feel like we've had this conversation a previous time I submitted a
> patch, several months ago. Yes, I think you're correct, the actual
> commit doesn't have a message. I also recall you looking at this before
> and I thought you had attempted to fix it.

Yeah, clearly not. :) I'll add it to my plan.otl

No worries -- I've taken this patch with minor changes (one test started
failing). No need to send a follow-up revision.

Thanks!
-- 
KR
