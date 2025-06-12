Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EC22BDC3D
	for <tools@linux.kernel.org>; Thu, 12 Jun 2025 17:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749751100; cv=none; b=uyyauBFFRdG5xR6oni9EmBL3umZqpUqxtwCqCFPxTTq0AJcvKCAudxhA++2dH9F4JwDLgXKt21b23Q/0CGL+X8/Ax8T1LyAiqWU7flrRzwS0DYvI5IzILHKrVh8HMtdDlTw7pDALpUJiXoRuhUGz8VA0n1s5ntLjwgU9Fr4QThw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749751100; c=relaxed/simple;
	bh=6XSk23u9oGcREc68UxC0nhwO9q5Qo4DxyiUNGcNGo8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kmW94NifZfz+lnMkrmToIFs+Vq4+3dvzRf5TaNSw58eVQnfgcw9qNZxAb6o9/IzJQzYYGKv3hLpASSQCv5Th6QUHLL5xv1w5+Yjnr/SoHrBSHsnoJsyU+q8Ba8ugaXpcoDEGbtr1Slfz6mbOz3IFeqbOaGburtLSJygjNH9A9uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=l/g+O4bL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="l/g+O4bL"
Received: by smtp.kernel.org (Postfix)
	id 6CADFC4CEEE; Thu, 12 Jun 2025 17:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 256EDC4CEEA;
	Thu, 12 Jun 2025 17:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749751097;
	bh=6XSk23u9oGcREc68UxC0nhwO9q5Qo4DxyiUNGcNGo8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l/g+O4bLWj/bH1UKznU9g7seTO+j0xWbn3LyZ45pxdrooK5P/LFyTW+y4PHCITS0B
	 SsnogSbLrNwtvwJntO9xQq/Ijb9R4BOpS87jw9DTqVj3iL6+HpkG3i3QevMU/lmRzw
	 L4pAxQpMDm5+1BEvFxMTfQWP7tYn9Vz4U7OVgp24=
Date: Thu, 12 Jun 2025 13:58:16 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: tools@kernel.org, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: Why are checks cached?
Message-ID: <20250612-fancy-bettong-of-brotherhood-a3e09e@lemur>
References: <65b3tv5latpw2xwrcnn7p34evviiyzq477kdneclj36dyoaged@wghv3olqemaq>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <65b3tv5latpw2xwrcnn7p34evviiyzq477kdneclj36dyoaged@wghv3olqemaq>

On Thu, Jun 12, 2025 at 12:48:18PM -0500, Lucas De Marchi wrote:
> Hi,
> 
> Yesterday I was caught by a surprising behavior in b4: it caches the
> checks executed by `b4 prep --check`.  I have additional tools for
> checks on my kernel patches and I was changing that particular tool. I
> wasn't really expecting a local operation to use cached results.

It assumes that if the commits hasn't changed and the flags to the check
command are the same, then the results will be the same.

> I double checked the help message:
> 
> 	-C, --no-cache        Do not use local cache when performing remote queries
> 
> For remote queries, it makes sense: do not download things again, just
> use what is cached. But for running checks, is it because checkpatch is
> checked out in the same repo? I'm using `prep-perpatch-check-cmd` to
> point to some external scripts.
> 
> Some possible improvements:
> 
> 	1) Just rework the -C help message
> 	2) Add a separate option (default false?) for prep checks
> 	3) Do not cache results if the tool is external to the repo
> 
> Or a mix of them. Thoughts?

Yes, I think just changing -C to say "Do not use cache" should be the way to
go about it. We already rely on that flag to ignore cache with prep --check,
so it's just the wording that needs to be updated.

-K
