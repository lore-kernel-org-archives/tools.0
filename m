Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916EE2C08C4
	for <tools@linux.kernel.org>; Mon, 13 Oct 2025 23:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760397731; cv=none; b=s53horgJhLtrcj/6fpEwD5aL1656Xky+6mgCfImSPGKpHCVORCFWiJH79ftIg8YJ32+DWuWEz/aB/SngAW1XZ4QL0uiNu0LVodXchLCt+TASSuIPFLINUaGP2XaSc5UZSFBNPbbuSHGSkKU770n2vNm9LiFL73cKfB91Jq0YM3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760397731; c=relaxed/simple;
	bh=PAZtsNBmu8TrSaw7T3Mqe2Hw9j/gBnFLaOhoeDUqfLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EC4nqABun1MaDzUzP9VDU5EAJrpPcvuWnuCvgEPi3bIpMFlmbtZEaiL9r8w5FHwJkweiWDrt4OUmMm1E0/syqi4oaBGp9WcyTSl7UpqQ1CdNU4BvOWu4WEDOgHHtrrju1XI9u8ZaLgyFs1ghDt7tgtz3baWk+K4IpTJ8rmmubAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sevauWKM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sevauWKM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2DB7C4CEE7;
	Mon, 13 Oct 2025 23:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760397731;
	bh=PAZtsNBmu8TrSaw7T3Mqe2Hw9j/gBnFLaOhoeDUqfLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sevauWKMIGGSpX+1XiPKnaG14j5CcgBfaPQaxhb75+dwL9SkxiFH6csnQY3zCmFku
	 2WBC9GlEvHkWhz54rFYwUZ1/L3cHjFnViCQiOLlmzxzQGYD0ah+T4FNbYyHhP/FoRW
	 JgpXjwsciMgqTNMZBY6MfaInOnFbSFPA1FqdYoecZjYtjKNdDRDMMAWC+IMBpMV2YS
	 ySGraHoZTV3ynzdRLVf1oL6dWVfdZ2J9q2JY4Hvw0GjV5RzRboGbAU0zTJ6u2jvtNQ
	 caJADUTb2BYncjc+wQjoCNtEXE/cca3pG731k2fsHB/KGwJFxmNwLFKb5FHnHwsb/j
	 iupnZZr88mq1A==
Date: Mon, 13 Oct 2025 19:22:09 -0400
From: Sasha Levin <sashal@kernel.org>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Junio C Hamano <junio@pobox.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@kernel.org, tools@linux.kernel.org
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
Message-ID: <aO2JoWLd0Mxc4oUV@laps>
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org>
 <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
 <CABgObfZS--70UTOpSXo=JOZViN1jm4O6M92pu-6Qunif3v1Y8A@mail.gmail.com>
 <CAHk-=wg4WfbXs-kMOAM7FmQ0w8q3KO9DC8CWLg1WPnoaZW-Wiw@mail.gmail.com>
 <xmqqy0pezhm7.fsf@gitster.g>
 <CAHk-=wh--VXgwQ3s8DLeag6cegsD9cPcvkmbVft0Gesy2aGPsA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHk-=wh--VXgwQ3s8DLeag6cegsD9cPcvkmbVft0Gesy2aGPsA@mail.gmail.com>

On Mon, Oct 13, 2025 at 02:44:28PM -0700, Linus Torvalds wrote:
>For example, while I think that a "git rebase --keep-merges" workflow
>is a bit scary and opens you up to lots of possible things going
>wrong, having some way for "git rebase -i" to *add* merges
>interactively might be a nice option.
>
>I've personally had the situation where I created some series of
>patches and wanted to group them later. What I would do is then create
>a different branch, rebase the patches I wanted to keep in one series
>in that branch, and then go back, and rebase the original branch with
>the remaining commits.

[...]

>Having a linear series of patches delimited by merges to group them
>and document them would probably work really well, but it would need
>to fit in with all the other tools, and as mentioned, many tools
>really do just do "patch series".

[...]

>So rather than doing a separate branch, rebasing things there, and
>going back and rebasing away the things in my original branch, doing
>just 'git rebase -i" in the original branch and having some way to say
>"this is the start of this series", and a "this is the end of the
>series", and having git rebase create a set of linear series with
>merges that delineate them might be quite convenient.

I'm using such workflow for my backporting work: I often want to group the
patch I'm backporting along with it's dependencies into a single "atomic" unit
to make it easier to review those changes later.

It currently uses hackery like the one you've described. Something like this:

   N=$1
   saved=$(git rev-parse HEAD)
   temp="tmp-triangle-$(date +%s)"

   git branch $temp $saved
   git reset --hard HEAD~$N
   git merge --no-ff -m "${2:-Merge triangle of last $N commits}" $temp
   git branch -D $temp


Which creates a structure such as:

   $ git log -5 --oneline --graph 11faed99eb
   *   11faed99eb030 FAILED: 64e0d839c589 ("mfd: intel_soc_pmic_chtdc_ti: Set use_single_read regmap_config flag")
   |\  
   | * 3bc90aaf9933e mfd: intel_soc_pmic_chtdc_ti: Set use_single_read regmap_config flag
   | * 08b4fd511c7f9 mfd: intel_soc_pmic_chtdc_ti: Drop unneeded assignment for cache_type
   | * f6d0ec2c9ccb4 mfd: intel_soc_pmic_chtdc_ti: Fix invalid regmap-config max_register value
   |/  
   * 2b2cbdcede387 (tag: v6.12.52, stable/linux-6.12.y) Linux 6.12.52


If you want to use it as part of your git-rebase workflow, just call the script during rebase:

   pick c3c4268124d22 # kbuild: Use '--strip-unneeded-symbol' for removing module device table symbols
   pick 4ee16af35eb65 # tracing: Fix tracing_mark_raw_write() to use buf and not ubuf
   pick 88d5c7c180dfc # tracing: Stop fortify-string from warning in tracing_mark_raw_write()
   x stable-make-triangle 2
   pick ed5afe51ba32e # irqchip/aspeed-scu-ic: Fix an IS_ERR() vs NULL check
   pick 89d38b0392fa4 # irqchip/sifive-plic: Avoid interrupt ID 0 handling during suspend/resume
   pick 3897851fae349 # Revert "i2c: boardinfo: Annotate code used in init phase only"
   pick 49a451202c681 # Linux 6.18-rc1


Which results in something like what you were looking for?

   $ git log --oneline --graph -10
   * 53cb9bf28b1b7 (HEAD) Linux 6.18-rc1
   * d6f9a71712aff Revert "i2c: boardinfo: Annotate code used in init phase only"
   * 8943a4934a860 irqchip/sifive-plic: Avoid interrupt ID 0 handling during suspend/resume
   * 12257b8fccebf irqchip/aspeed-scu-ic: Fix an IS_ERR() vs NULL check
   *   decf0198935a6 Merge triangle of last 2 commits
   |\  
   | * 88d5c7c180dfc tracing: Stop fortify-string from warning in tracing_mark_raw_write()
   | * 4ee16af35eb65 tracing: Fix tracing_mark_raw_write() to use buf and not ubuf
   |/  
   * c3c4268124d22 kbuild: Use '--strip-unneeded-symbol' for removing module device table symbols
   * 0f43fbd0b759c s390/vmlinux.lds.S: Move .vmlinux.info to end of allocatable sections

-- 
Thanks,
Sasha
