Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EBC25EFAE
	for <tools@linux.kernel.org>; Thu,  5 Mar 2026 23:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772754744; cv=none; b=BeZQLjvgKNthKESd874kFGVWN8rE09hsF/XYxgYVmxviGlurI+q8UZwaZ5JTiqnFf8ZmpftF4gc1m8bZeENKr4b9o1pH3VqcNqT57Ncj/Y0Da/hSOIZB/jAtf4SvaUQPauajXeSjdmPSBskvw/IiIKzvLrhCEjkXfDT3QvvY4YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772754744; c=relaxed/simple;
	bh=9vR0WHzrfvrmpnqB9bP37L4E0ekSFlsvv6JXdcTub1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MlmXX8PBgzVmfI0dVzb2F1DJsmWiV3v4Te5WXM8HAumg9DSGNBn4oWol4MG0GISdigKZznCa6CoGI2zsdSTlVupYLZSBfOgVDVv6uoXFx2kjUEndh9rSVWsyX5Bo7kbCcGtCeG4Y/yzGHQ4rTuEjVuOAeeU1RH7MlzAOYGUrCVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JmQObZns; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JmQObZns"
Received: by smtp.kernel.org (Postfix)
	id CEEBBC2BC87; Thu,  5 Mar 2026 23:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C04DC116C6;
	Thu,  5 Mar 2026 23:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772754743;
	bh=9vR0WHzrfvrmpnqB9bP37L4E0ekSFlsvv6JXdcTub1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JmQObZns+d4biy8/8kginraz8/s0KPkFZbSFHq5wKAXeY7Sr8La4MhhIeNoww4H+T
	 1+ji/yhTfa262uWLZWBp3vbN9BDn7fBxuwB4OQOiTKFx8P3jQvNr2e02aNC1KQAxMX
	 OOq7AtW6rUxtCmtPQ28FdlBGHvmxcvt3PB+ntFZM=
Date: Thu, 5 Mar 2026 18:52:22 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: B4 Bugbot <bugbot+b4@kernel.org>
Cc: tools@kernel.org, broonie@kernel.org
Subject: Re: b4 dig not finding commits due to alternate sender emails
Message-ID: <20260305-solid-cordial-trogon-dd2003@lemur>
References: <aa4a44c9-7fee-4dd3-aafe-dca46c7038d0@sirena.org.uk>
 <20260305-b0eaec40940b268751f7e69161014d648e8242693df2e65b8ccc00a6e991eaf92-bc264a0a2715@git.kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260305-b0eaec40940b268751f7e69161014d648e8242693df2e65b8ccc00a6e991eaf92-bc264a0a2715@git.kernel.org>

On Thu, Mar 05, 2026 at 11:40:41PM +0000, B4 Bugbot wrote:
> This conversation is now tracked by b4 bug tracker.
> There is no need to do anything else, just keep talking.

Sorry for the noise!

(But it does work. ;)

-- 
KR
