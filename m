Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E317E107
	for <tools@linux.kernel.org>; Fri,  6 Jun 2025 03:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749179594; cv=none; b=UXOl51KBniUKn9tGmHpJ++c07bBl4W22gfpkbbcsbnq+UZGTZ5dfu099eP2eY+O/vKFNXpJF/OPVeo++JopHSaKzoorJ2Ua2GRWhYYgvA3k24icZNhrRxKQt1xFa8EBhdwTsS7iF7Wjw940qW66AqdPIw5TWizSyyfcV73/hHLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749179594; c=relaxed/simple;
	bh=2Y3HwpJK9aBnNdWZi8yDvybOolp6pIkYGlCe4mm67y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xp88kPVzf+UDNANOGimeZWfs5xFTmLqLQEb32b7dKscYRwPK7h13glT+JkOjnQZ+JDpJQA7n+K20sYd5VQ0jfNtFcKN70eJvgFCnXaryBc2RUZMgLxINgztk7x+8jfcA8oc5KqQmh7BHPd0nCgZlIT35/Y70eU07hBXk/DclPYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=R96i/6g/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="R96i/6g/"
Received: by smtp.kernel.org (Postfix)
	id 114A6C4CEEE; Fri,  6 Jun 2025 03:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB7D4C4CEE7;
	Fri,  6 Jun 2025 03:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749179594;
	bh=2Y3HwpJK9aBnNdWZi8yDvybOolp6pIkYGlCe4mm67y4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R96i/6g/sDtVJDcSfS9pLCNu53dsn2mtgUVcpIQ53qMQ/z3zSx5waZIxQAkPVt4+U
	 freEYOrAMtfjEnfukY0K+RFt1fq4TJmQPicyP+shb4aguE24KEGJaneUQHG/nvtEW9
	 DEV6z6uomzzPaheSICZgkYBXM41Xu8a5I2EfYirM=
Date: Thu, 5 Jun 2025 23:13:09 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: tools@kernel.org
Subject: Re: Need clue: b4 working with dependencies
Message-ID: <20250605-ebony-mackerel-of-symmetry-7c8367@lemur>
References: <67f86f2e-d3ac-4fbe-87d6-186487de5721@oss.qualcomm.com>
 <20250528-sparkling-expert-taipan-5ad429@meerkat>
 <811aed03-7717-4e04-98d5-e91f05df26e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <811aed03-7717-4e04-98d5-e91f05df26e1@oss.qualcomm.com>

On Thu, Jun 05, 2025 at 04:05:44PM -0700, Jeff Johnson wrote:
> I'm trying something very basic.
> 
> In my ath.git tree I have a base tag ath-202506031604 (hash c3910de7bab7)
> I have a public patch I created with b4:
> 20250605-hal_reo_cmd_status-kdoc-v1-1-e59f4b814b88@oss.qualcomm.com
> 
> This has the b4-generated trailers:
> base-commit: c3910de7bab78afbc106206aed5ec8e79458fbee
> change-id: 20250604-hal_reo_cmd_status-kdoc-c3f3a25237c5
> 
> Now I want to create a new patch based upon this published patch.
> I tried:
> b4 prep -n hal_reo_cmd_drain -f b4/hal_reo_cmd_status-kdoc
> make edits
> git commit...
> b4 prep --edit-deps
>   (add the following from the published patch)
>   base-commit: c3910de7bab78afbc106206aed5ec8e79458fbee
>   change-id: 20250604-hal_reo_cmd_status-kdoc-c3f3a25237c5

Should have ":vN" on the end to indicate which revision:

    change-id: 20250604-hal_reo_cmd_status-kdoc-c3f3a25237c5:v1

> b4 prep --check-deps
> Checking base-commit: c3910de7bab78afbc106206aed5ec8e79458fbee
> Checking change-id: 20250604-hal_reo_cmd_status-kdoc-c3f3a25237c5:v1
> Grabbing search results from lore.kernel.org
> Grabbing thread from lore.kernel.org/all/20250605-hal_reo_cmd_status-kdoc-v1-1-e59f4b814b88@oss.qualcomm.com/t.mbox.gz
> Testing if all patches can be applied to c3910de7bab78afbc106206aed5ec8e79458fbee
>   [PATCH] wifi: ath12k: Fix hal_reo_cmd_status kernel-doc
> Magic: Preparing a sparse worktree
> ---
> ● change-id: 20250604-hal_reo_cmd_status-kdoc-c3f3a25237c5:v1
> ● base-commit: c3910de7bab78afbc106206aed5ec8e79458fbee
> 
> So far this seems ok.
> Then continue:
> b4 prep --auto-to-cc
> b4 prep --edit-cover
> b4 prep --check
>   runs checkpatch, gives Success: 1, Warning: 0, Error: 0
> 
> Finally:
> b4 send --no-sign --reflect
> 
> The reflected message has the footer:
> base-commit: c3910de7bab78afbc106206aed5ec8e79458fbee
> change-id: 20250605-hal_reo_cmd_drain-801771bbf653
> 
> There is nothing that reflects the dependency, and the patch in the e-mail does NOT apply cleanly to the base commit.
> 
> So I'm apparently missing a step to have the prerequisite-* tag(s) added.

The fact that it's quietly failing is a bug. I'll add it to the tracker.

Thanks for the report.

bugspray tag me
