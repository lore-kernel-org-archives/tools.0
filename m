Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DE81D63EF
	for <tools@linux.kernel.org>; Tue, 19 Aug 2025 03:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755574384; cv=none; b=bLhFx2z8JgDA2k3YZZJBj8Hrli+sG7EhOR3j6rqB/E1cdKwcQsAPvSZPn6mz+mSclmbr2ryrY38cCV6g+cTdeN/jTemr3w2PmTzNB7QRTsS1aq1WFsAseUrh3bhlnRp6vLVTg8TUSkHNJyA2faUdrTjzxf4PozdXP1cx9Lz0QVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755574384; c=relaxed/simple;
	bh=ftV3AcOxN+BqGlLxB4onC/S4akukxV0aMZ9Iz1z4rOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n62p25U4TzK4dNcAMVtII2nsBU9dz95lDV+G8U26pR6a1FAoKDP+nKuNGiiqayPid0BSpU8/PQAQbLd86pD9+0SuBFYViIA/TggHK8Xd3WnMKtdEMmEkPxl7eb9qPzruUpVjC9ZzF1csXhnIQ4lF7t5Cgs6cwDeJuGNkMNtO3e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oEDuE9QV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oEDuE9QV"
Received: by smtp.kernel.org (Postfix)
	id 61F69C116B1; Tue, 19 Aug 2025 03:33:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A41CC4CEF4;
	Tue, 19 Aug 2025 03:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755574384;
	bh=ftV3AcOxN+BqGlLxB4onC/S4akukxV0aMZ9Iz1z4rOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oEDuE9QVSVnLrWCvuwe1jp9vCjh8D+NznBo5acoXWXq6jNrCYsJ8403ZblGodKUMy
	 4dTN9bte435jgVN0u4CGTdmdr+m0Q8T2ZvuiNvZzM09rjukE1ERhhcR7mIygxOZMTT
	 27cQRLkYUkiBnQSFKjq4fSZS0phS2x2DZLypCS/A=
Date: Mon, 18 Aug 2025 23:33:03 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4 v2] Add Git version check to prevent crash with
 '--default-prefix' parameter
Message-ID: <20250818-cyan-pogona-of-promise-6a4bc3@lemur>
References: <20250819-ver_check-v2-1-46faa2d6c934@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250819-ver_check-v2-1-46faa2d6c934@oss.qualcomm.com>

On Tue, Aug 19, 2025 at 11:02:26AM +0800, Yijie Yang wrote:
> The '--default-prefix' parameter was introduced in Git 2.40. Environments
> running older versions may crash with errors like:

Pretty good, just a few minor improvements:

> +def git_check_minimal_version(min_version: str) -> bool:
> +    ecode, out = git_run_command("./", ["version"])
> +    current_version = out.split()[2]

It is better to use:

    git_run_command(None, ['version'])

"None" is because this command doesn't care which repo we are currently in,
and is more consistent than using './' here.

> +    if version.parse(current_version) >= version.parse(min_version):
> +        return True
> +    else:
> +        return False

This can then be simplified into a more pythonic version:

    return version.parse(lines[0]) >= version.parse(min_version)

Best wishes,
-K
