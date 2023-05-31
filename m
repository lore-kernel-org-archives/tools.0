Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E86D18AED
	for <tools@linux.kernel.org>; Wed, 31 May 2023 20:41:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93912C433D2;
	Wed, 31 May 2023 20:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685565665;
	bh=YhTFFitQZZ8ngl+UujLYwO4rSIRLfVZ8pZMGi4ALxEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UBVkX0e5ILvDHUr8g+o1znDkUoX7/pdolqIkkBZ2cWunV2npLMP25a00f4xZcUL+9
	 UHpFLQGeSK5XkrC6xDbZdfDsZq5zeM8Nb7haJvFGT2TMYX0y6OsEN1pjSaLmmif+RF
	 ZMgJhQ3K0XVp0f/xqTq6UQseHUIebYrcGjwgAX6ZCqceajYaYRFaYHigf48pJU52zZ
	 x0bTBUC9gDj1vSlTzQkpt/I1Aec/OHMcerbxtdcn2wrfSfuYc5wsFdbk1BMdzNis03
	 VxpcdaErVYPKZd9SBL0SYsTNqW/Gq3/MiIzBu0a1M5ldAx2h52Ls/7ZGwLKW2E50J3
	 IhTic4lbkW5Ow==
Date: Wed, 31 May 2023 13:41:03 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Maximilian Weigand <mweigand@mweigand.net>
Cc: tools@linux.kernel.org
Subject: Re: b4: workflow for selecting to/cc targets of individual patches
Message-ID: <20230531204103.GA1864972@dev-arch.thelio-3990X>
References: <bdefe087-28a2-d541-933c-ccd743cc8b62@mweigand.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdefe087-28a2-d541-933c-ccd743cc8b62@mweigand.net>

Hi Maximilian,

On Wed, May 31, 2023 at 08:57:58PM +0200, Maximilian Weigand wrote:
> Hi everyone,
> 
> as a very new and inexperienced patch submitter I am currently
> struggling to properly prepare/submit a patch set where patches are
> targeted at different maintainers and would be interested in the
> proposed way to do this using b4:
> 
> My understanding (also from reading a bit in the tools archive) is that
> the cover letter should be addressed to all maintainers and mailing
> lists targeted in any of the patches, while individual patches should go
> only to the maintainers (via To:) and lists (via Cc:) they are targeted at.
> 
> Using b4 prep --auto-to-cc is not an option here, as all To:/CC:
> addresses in the cover letter will be used in all patches (my
> understanding, based on b4 send --dry-run tests).
> 
> Therefore, the only way I currently see is to populate individual
> commits/patches with To:/Cc: lines in their respective trailers, e.g.
> based on suitable (manual) calls to get_maintainer.pl, such is used
> internally by b4 prep --auto-to-cc. Is that the recommended way?
> 
> I have not seen many patches on the mailing lists that contain To:/Cc:
> lines in their trailers and am wondering that behavior would be
> acceptable? If yes, would it make sense to add functionality to b4 that
> would populate individual patches with To:/Cc:, similar to --auto-to-cc
> does for the cover letter?

I am not sure if this is the "recommended" way but what I have done in
the past is included the To and Cc trailers in the commit message of the
change in git with a '---' between my signoff and those trailers,
something like:

    <commit_title>

    <commit_message>

    <trailers>
    Signed-off-by: name <email>
    ---
    To: name <email>
    Cc: name <email>

You can see what it will look like if you flip through the patches here:

https://lore.kernel.org/20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org/

I recommend adding them to the scissor area (i.e., include them after an
explicit '---' in the commit message versus adding them to the
<trailers> area) so that when the patch is actually applied, they do not
get included in git history, as they can result in extra spam if any
patches end up in a stable release.

It might make sense to have some way for b4 to do this like with
'--auto-to-cc' but I would generally say it is rare to need to send a
series with a conglomeration of patches with a single cover letter to
multiple maintainers, unless you are doing a massive treewide change, in
which case, it is often better to break down the series per subsystem,
which can help with tracking and sending new revisions. That might just
be my opinion though :)

Hope this is helpful, cheers!
Nathan
