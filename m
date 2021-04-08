Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05676D0D
	for <tools@linux.kernel.org>; Thu,  8 Apr 2021 17:01:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DDADB610CB;
	Thu,  8 Apr 2021 17:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617901283;
	bh=3yS6fKE3LiI7nlqcEDCB1tbRuam0PjZCk+cWX+YkoRs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=A4qPArth8RihMTwvgc11UMl/7hAnPLZezO/O9x+1EoX/fFDh3MKoCK36T9RgCbhWc
	 pQanoymu0TZ+wYGrKIj7tNPhdPSxB7RyBL9pTNAbrWG/r3lUyEMNa1JKaEuiBS+Cvf
	 q4+MOFYfKDK3hqg4lMxqCO9IhZalIMwGSPORQSck8kCxjDbYOz7ZqXNDEYGUmPTIDp
	 G6kfCtUtlI1gWzNjcQ8+F572shpEifmkqEJkMdhsl5ZrRN4micdlk3mZMOL+b6E+R9
	 dMWrx1olaljcbNr56611AJQ1AgROJAB+L6JnHkR+s9akuelps1zF0+tHzIfYifuRot
	 S5u5ynN0mpjgA==
Date: Thu, 8 Apr 2021 12:01:16 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: tools@linux.kernel.org
Cc: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Subject: Re: b4 corrupts patch
Message-ID: <20210408170116.GA1937704@bjorn-Precision-5520>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408161833.icwv2ncdm37dvzbs@nitro.local>

[+cc Zhiqiang]

On Thu, Apr 08, 2021 at 12:18:33PM -0400, Konstantin Ryabitsev wrote:
> On Thu, Apr 08, 2021 at 11:02:26AM -0500, Bjorn Helgaas wrote:
> > b4 seems to corrupt this patch when fetching and adding a Reviewed-by
> > tag:
> > 
> >   https://lore.kernel.org/r/b411af88-5049-a1c6-83ac-d104a1f429be@huawei.com
> 
> Hmm... this is because the trailers are separated from the basement using '--'
> and not '---'. Git gets confused, too, as if you apply the patch, you will get
> this at the bottom of your commit message.
> 
>     --
>     v2: rewrite subject and commit log as suggested by Bjorn Helgaas.
> 
> b4 messes things up a bit more because we mis-recognize that line as a trailer
> and move "--" above the rest of the trailers (at least "git mailinfo" breaks
> it up that way).
> 
> I'm not sure if I should fix this or not, as this is not a well-formed patch
> to begin with.
> 
> Suggestions?

I'm OK with leaving it as-is.  I cc'd the submitter in case there's
opportunity to avoid this pothole in the future.

Bjorn
