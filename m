Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B66152785
	for <tools@linux.kernel.org>; Thu,  9 May 2024 13:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715262453; cv=none; b=ATun8s2augO/jcpvv9i1Oo53mezMW8TMbknpUtndBZoAb6OdrWEKBuHkiX4Kwdz5UB5Bh+5Rv7cFG8XtsUxK/4oTDUbayp+PRjE9WPH1rxwBimujq4UcXqYfelCTo8v9FGyI4XVXmCiJEyDNO5nETihdbzgF79rQYkGPdHDKScA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715262453; c=relaxed/simple;
	bh=hjIcFwurCVDJlmiHzSCs78O9Gplq7YHSQD2yNskNxn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fb5TwxZBZ/u/URk39uf9IcieEgjF4ScYp33dCRkcPTo8Rzr6uCP1ds2bN/fjA2LV+fDNPsCizujiC1WWqbD75/0wWnwynAnd6T+NU7WdIZ7iQ1DuO0lXFtLfOb9dtVrCKzYibU3t0D56nZa9sx9LblEHH6W0SCi6NLEd5aIkjLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SQ6lXBW5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SQ6lXBW5"
Received: by smtp.kernel.org (Postfix)
	id 9C780C2BD11; Thu,  9 May 2024 13:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65ABAC116B1;
	Thu,  9 May 2024 13:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1715262453;
	bh=hjIcFwurCVDJlmiHzSCs78O9Gplq7YHSQD2yNskNxn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SQ6lXBW5Z72ZtcjD0rdCrffaxvVXaGDL9Qg+RV5XIKNZ3ootqRkonNZw9m95exQEX
	 AsPwqE3XY3qsOw6V8LgI1zxKwDOdSwAbynjzECZYP7Nz8Ezx4jn29HdKPUYAhfLM0Q
	 yZ2hYemBWxVDY+A5gypQmJpZ1jUWHzzAUwuKq3qM=
Date: Thu, 9 May 2024 09:47:32 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: tools@kernel.org
Subject: Re: b4 shazam not stripping ---
Message-ID: <20240509-gay-angelic-raccoon-3f67c2@lemur>
References: <2510008e-23d5-4c15-a16c-be9de549a425@citrix.com>
 <20240509-victorious-lean-mamba-4e77b7@lemur>
 <65ab295c-e613-4367-a4a1-2cd04581fd29@citrix.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65ab295c-e613-4367-a4a1-2cd04581fd29@citrix.com>

On Thu, May 09, 2024 at 02:43:48PM GMT, Andrew Cooper wrote:
> > Can you let me know what repo I need to fetch to be able to apply 
> > that patch?
> 
> It is xen tip, as long as you've pulled up master within the past 2
> weeks.  I happened to be testing on top of a2330b51df2.
> 
> But if its git-am going wrong, then probably the only option is to keep
> vigilance for it happening.

No, you're actually right -- this happens before we hit git. I was able 
to recreate this with "git am".

I'll try to figure out where things are going wrong with message 
parsing. It's probably related to the fact that this is not generated 
with "git format-patch".

-K
