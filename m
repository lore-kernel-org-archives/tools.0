Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D008A28A2D4
	for <tools@linux.kernel.org>; Thu, 13 Feb 2025 18:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739473122; cv=none; b=tCvcSDOC4ZLLV43fdjIVZXj//wxj3IuZyZ8NmUnodso8HW1eoxwqwC/zlVFHG04N5PkN8OOvGBFu0Rqem2a9MtV8bE7YPSwJC6sExoY1K4GK+tm8sIJNvlWGINQbO3mSrE1BthNFlJ+h6yHBJyj1IPLWUXCRtOOrxRB8FflwaSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739473122; c=relaxed/simple;
	bh=9mN7aby/CLR+Tlrwvje2S45NAjmAjv6wschp6hNxuY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQ/EAPEGrOUyaUEeNCn5XnjqlB5bmNzWys76wxmeIZG/6Fkm36bwSjldkNS8vVT6OqIjhwmGmqIcMHLo05SXQT+TBzJvKXpNlOJiMZUcFdQwKWet+5YatlrgO9WEbqJA0BvDuURk3ZQ0Ygvt9aLdaLFGkmiLkFBQaNoqEMRehnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=i8lrAn1G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="i8lrAn1G"
Received: by smtp.kernel.org (Postfix)
	id 51110C4CEE7; Thu, 13 Feb 2025 18:58:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 174CCC4CEE4;
	Thu, 13 Feb 2025 18:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739473122;
	bh=9mN7aby/CLR+Tlrwvje2S45NAjmAjv6wschp6hNxuY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i8lrAn1GloSmysnlnVisEcKuURtKiIPRyM95biqshVPxtufE7G25FWdCCz76OqSQ0
	 gHCRY6IY6hi9yrv6iYvfk8VQFsC76d34GeZwRmu12kkH9fQ6hqw97xLN22cEUg9w9s
	 hTCFfEt7mGKwmWfBQZTIJ/aO2/U10wgbiukN6UEk=
Date: Thu, 13 Feb 2025 13:58:41 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: tools@kernel.org
Subject: Re: Way to list pull requests with b4 or lore?
Message-ID: <20250213-independent-tireless-hyena-41f604@meerkat>
References: <20250213144722.GA522528@fedora>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250213144722.GA522528@fedora>

On Thu, Feb 13, 2025 at 09:47:22AM -0500, Stefan Hajnoczi wrote:
> Hi,
> I've been using b4 and lore.kernel.org more and more recently, they are
> awesome! Is there a way to list pull requests from b4 or lore?

Happy to hear you find it useful. Can you clarify what you mean by "list pull
request" -- do you mean, "show me if there are any outstanding pull requests
that I haven't yet processed?"

-K
