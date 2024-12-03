Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80371FDE2B
	for <tools@linux.kernel.org>; Tue,  3 Dec 2024 18:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733251468; cv=none; b=mo2BYLjELuEw08v9RlTga4mQuhSNP8sKr8UBcqfHTUEZzcAuc51XQaSCPRwoCjO8u13sRGn8N/x6s4y+BKSMbiuMyCMmUzGqwolrYRQhSrTCFkYeAAf+R76MN3e/3EvLTSuobe2+/N23vvEVkNN6DgpBoz/d6nak0WFK0uqE9fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733251468; c=relaxed/simple;
	bh=Rqks2mceC0D32ME8E3uX9i3faabiWg3QuNVbzI3m5qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dlLug+HolYUJ0OBkskqoKxZ9akYeirEracAkLLxfNcRkVaXbYhZAE075EqXTD65eruSJcg/819EbMLnBR/keS7fBMTpc0zQQiFMhLD9q5vNH1TLXiErS6pZpARnoF982AVDki9TOdBqJdfERn9ZI3uh6WKMHSWUHuPosI5JNMTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jatXNQag; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jatXNQag"
Received: by smtp.kernel.org (Postfix)
	id 3E624C4CEDD; Tue,  3 Dec 2024 18:44:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F41BCC4CED9;
	Tue,  3 Dec 2024 18:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1733251468;
	bh=Rqks2mceC0D32ME8E3uX9i3faabiWg3QuNVbzI3m5qk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jatXNQagQquKYyAq1wrrnZeSmYIRg1rV1SSaDZIeYpcJJfMFkgrenGLNoCn1lq7ad
	 hM7KfrA0kzyitSFJZmcmdDsLIgn4g/eG1An1Vh+Si2s8lSgN9+XD7RfPoP9IR3DONo
	 jhtXWHjQXLolhYRVQ6TJIib7joBpIndLQE0Bo/Sw=
Date: Tue, 3 Dec 2024 13:44:26 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [b4 PATCH RESEND 0/5] Resolve some static typing errors
Message-ID: <5u53v53wb7u2cmhg5muq4nemzpwh3wvd7kz4fi6uamutl5s3oa@gqrfslzn2eio>
References: <20241108-better-type-annotations-v1-0-ebaf0129d9e1@gmail.com>
 <CAJ-ks9=jGp8d4q0wqRqZ8Lut3o-QypwR8EP3bfBmXXTNjQVvaA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJ-ks9=jGp8d4q0wqRqZ8Lut3o-QypwR8EP3bfBmXXTNjQVvaA@mail.gmail.com>

On Tue, Dec 03, 2024 at 12:04:10PM -0500, Tamir Duberstein wrote:
> Gentle ping. Kostantin, how can I help move this forward?

I hope to be able to get back to doing b4 work this week or next! Sorry about
the delay -- the holidays and other priorities were keeping me occupied
elsewhere.

-K
