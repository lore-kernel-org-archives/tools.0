Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B5D254859
	for <tools@linux.kernel.org>; Wed,  5 Mar 2025 20:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741204802; cv=none; b=kczyTjHayJBjCaOuM1B6UYB8kxrwMKh38LmWgztxPyJxRlytlftVlo7Olw/5kHFnUDgkARuF0Pg+orNoEDRF+8LqbeR49uowxSIBOrnFqjNEYmK45af4z9/bqIKUDXy0vHxPM+tXQKRM3C01fapCru2FVUsvM9BCB6bS+/AdEms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741204802; c=relaxed/simple;
	bh=8HEWa2CWt6qCNwEH+sSsP8zrzzQDuRZcoHZlYl023AM=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=kefcBAMwvL6UWwkfOhRH3FV/5K4yD3UU3NDJLj3xRaeryzwUi30wbz2SIQ50aCQQmtAeqb2dCzNaI81Bevx6IMfRNl/0dCOouhoDShEoLhXtPefWeI4jck9ThpvQ2i0A5Fbf88QFE0apeyMVEvbG4HV10QJJw5NIAZJtVKaiQK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=elQr75Sh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="elQr75Sh"
Received: by smtp.kernel.org (Postfix)
	id A8EB6C4CEE8; Wed,  5 Mar 2025 20:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D40DC4CEE0;
	Wed,  5 Mar 2025 20:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741204802;
	bh=8HEWa2CWt6qCNwEH+sSsP8zrzzQDuRZcoHZlYl023AM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=elQr75Shj6Wr8mzLtHok0KMQUI8la5ooljIIbOg9Mfq22U81dmWWf4EAuEtwaoPQz
	 PBRzg0ZUhE19VfI6VWwdhIYWxUac9qlzQEj+h9E75jN6TK1B5wzdjIBp9cNVJ46mY7
	 8u02keVW8Ccw5AK8uI9v1SBfMsC4r+VuZzdN1iX6C7k6JE96ENTTqpMJkuJ2e3PHF4
	 ESugxiVjivqchhPKA621HeFFrhoRLDkUEOCOnct2JSJwBkfzNBMzP+kFjMJAoPkDRG
	 pFUlmZYm6tGZtJ65MScDLV1tW0emXlFmPZ/Amb4wQxHclp0igwM13yfMxfK4WjPf4R
	 cwctX6TEWvNwQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B5E04380CEDD;
	Wed,  5 Mar 2025 20:00:36 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: konstantin@linuxfoundation.org, andreas@gaisler.com, tools@kernel.org
Message-ID: <20250305-b219843-87002393b5b8@bugzilla.kernel.org>
In-Reply-To: <5972f5de-931a-4186-ab0d-cd226f19cde6@gaisler.com>
References: <5972f5de-931a-4186-ab0d-cd226f19cde6@gaisler.com>
Subject: Re: b4 am getting extra patches and missing patches
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Wed,  5 Mar 2025 20:00:36 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=219843

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

