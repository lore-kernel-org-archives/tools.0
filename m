Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69EF23F40C
	for <tools@linux.kernel.org>; Mon, 18 Aug 2025 16:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755536139; cv=none; b=rna+uNJhWc2UFUYc4jIoSwVZFTtXlomBl9VlFgNh2W7KFtJDDqpsNH3tWWpn+Ky9Gxs6ngj8I2GcevC0RUo4OIcW9dPqMgvihrAGUVC2dCzjQTX7sO2VQAxG1Z+gWhZK/wsY9oxY/Ngq3o4WnHvziI8kCdizS6YH7+LAlwK5ilw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755536139; c=relaxed/simple;
	bh=uxtAIjsnTBalBvOctKxB2HNfsoAXhUViFcrdVGF5Vpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G67gIAtHWWnoxwHlg5hnZJAJv70jnTb7pZWeI2SlJFF67q8bLXgyUKcLSCvQw2aa+oKTiZ6NsAJ9DyhL1Nx9x+LdQ4oU3AJzmerUrkNLK3toEG72fXHolJjqQP6PpfDwaOhijMzJ6aGvbio/zL5//q+tEA6vNKB+iYcgvT8p/Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1lcCq9An; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1lcCq9An"
Received: by smtp.kernel.org (Postfix)
	id 4A9BEC4CEF1; Mon, 18 Aug 2025 16:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04333C4CEEB;
	Mon, 18 Aug 2025 16:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755536136;
	bh=uxtAIjsnTBalBvOctKxB2HNfsoAXhUViFcrdVGF5Vpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1lcCq9AnA2IYtzJCvM0Pz3T3ocQyCcpJwjEYBejXA9ibplMPr3c2pTq73ZLZyIvak
	 Q78h/U7IzHe0IQ78YvpqjouKPOl9q3RH6QlE1SrGbVq90zRpk16n6GRuIvJB3V6ibO
	 21M5FlfbREO5PgRR+S6PgYpr/hpkmkq5LsSUirL0=
Date: Mon, 18 Aug 2025 12:55:31 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4] Add Git version check to prevent crash with
 '--default-prefix' parameter
Message-ID: <20250818-tough-poodle-of-politeness-feea52@lemur>
References: <20250815-ver_check-v1-1-9fdc9f201bac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250815-ver_check-v1-1-9fdc9f201bac@oss.qualcomm.com>

On Fri, Aug 15, 2025 at 05:05:12PM +0800, Yijie Yang wrote:
> The '--default-prefix' parameter was introduced in Git 2.40. Environments
> running older versions may crash with errors like:
> 
> CRITICAL: Failed to convert range to patches: Could not get a patch out
> of 5f8e8d5b2c840f8fc5185c2f90d6d275535a6aea
> 
> This change adds a version check to ensure compatibility and prevent such
> failures.

We'll probably benefit from this in a number of other places. 
Do you mind making a new function in __init__.py like

    def git_check_minimal_version(version: str) -> bool

The function should use git_get_command_lines and return true if the version
is equal or newer than what is passed as argument.

Then you can use that in the check for --default-prefix.

-K
