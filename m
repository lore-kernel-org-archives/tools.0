Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617101B21AD
	for <tools@linux.kernel.org>; Wed, 12 Feb 2025 15:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739373379; cv=none; b=RkC9xOdDX5fcq6m9SlloPfzfEhkUajpKPUTr6hzqNYzvkNsRXQivkOmxWozvv+jKzIBHNCIJD+BICRjwiAo3ohqWchiJFK//fyZ/JuS+vJYDvDSCxW040hehSmbsTShaWdZE1n/yBSS5jS6vyheI5i48jpNtQbvSCLvFw4PFYsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739373379; c=relaxed/simple;
	bh=wz9Qa4X18tCcS/mjkg1GypVXDOB34GYauPVLEh3RUDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gvGgGwwAlYtGxnwbxuH0w+lbsdULpORqiftIPpuNkISCdcZwczZ39Ev3PK+6ueoOhGzoFSoVLJqjPY2nZfnDCgp5hF5efPlDXpLRCbLO78Lgrqy/LDS2AC8io2QffC3ANEgM2AiqC29vRKheCbcyH7VOMRjrG2vd+fLBjNzjiDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xgsBZeI9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xgsBZeI9"
Received: by smtp.kernel.org (Postfix)
	id 328B2C4CEE4; Wed, 12 Feb 2025 15:16:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFABFC4CEDF;
	Wed, 12 Feb 2025 15:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739373379;
	bh=wz9Qa4X18tCcS/mjkg1GypVXDOB34GYauPVLEh3RUDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xgsBZeI9FZofT2JFhacBXgJN0z2w2krhmrFNPL62onBhgei+HNeffribumuGitPPD
	 CKF3RiD6ltN5xTxlSyemBMLSc6VY16z813pts9e4udGv3CeaRYaydgLvJn4lbBuGHb
	 bmrSPE9bulxPrdw73Hn/3FsLbkvHL4qQFAtcrtxM=
Date: Wed, 12 Feb 2025 10:16:18 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: users@linux.kernel.org, tools@kernel.org
Subject: Re: Lore not indexing since few hours
Message-ID: <20250212-kestrel-of-stereotyped-democracy-25ec1d@meerkat>
References: <1eb87226-4528-4fba-929a-6a63e6418689@bootlin.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1eb87226-4528-4fba-929a-6a63e6418689@bootlin.com>

On Wed, Feb 12, 2025 at 02:55:29PM +0100, Louis Chauvet wrote:
> Since 8:47 UTC, lore.kernel.org seems to be experiencing issues: no emails
> are being indexed. This is problematic when using tools like b4, which
> relies on lore.kernel.org to apply, review, and fetch patches.

Yes, the crawler bots have discovered the main system from which we replicate.
I've applied mitigations now and we should be replicating again.

We'll also tweak monitoring because the way it was failing was not picked up
by our "is this alive or not" checks.

> If this is a duplicate report, I apologize. I did not find any "status page"
> for lore.kernel.org nor any emails on tools@kernel.org regarding this issue.
> 
> For future reference, is there a specific mailing list to report
> lore.kernel.org issues or to get the latest updates?

Infrastructure stuff should go to helpdesk@kernel.org.

-K
