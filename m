Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B4B1805E
	for <tools@linux.kernel.org>; Fri, 26 Jan 2024 16:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706286923; cv=none; b=s6h/lu85ZQT1IPpKkASXM6Jc23qvm+5UWKhR1Svk2u5I0lAzOZgo+AM1fSZteu4p80NL0Zv++qu51s75aelzWLB4a2KSNhu7V7olpQIztBfZykacpwfxgt5qypIxNXfPAFxX6FgIbTk5VmPatPW7M9aPgH8M+bwYz1LHP8rHO/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706286923; c=relaxed/simple;
	bh=Jd8WcEawUPirNsw1tTzf6WNVi00bvWOgUa/Yf0DFMbw=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=GTcxY/UdYp5gmAxYemWcK2zMooZJJqrPdm0kRGGDJvKtu33mINLh8GJLeVMz4jfHuXf2AVW2KX5SjKGAiIafbo8SuZEmGVkmHDCkiZlWqV9pdfMSZtPz+s82z1LrnKHE+26PJ3i1WuAAW6JQDgI/Q87vAeqHJYabfQaJjQ+KR6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ppCkThtg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ppCkThtg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7BA2C433F1;
	Fri, 26 Jan 2024 16:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706286922;
	bh=Jd8WcEawUPirNsw1tTzf6WNVi00bvWOgUa/Yf0DFMbw=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=ppCkThtglNl6+/YirWa6oNiyXmAUjbmBbr/vcw02TqBX/EHw5GZfFjohANMlwGqPz
	 +e2HAlsHuICQ1gGsjpV85yJc4kwt2tQBLNegeAk/JfCpKS8hF7YcKg7B8PgHeDx1Nr
	 QgquNJw+QDldliKBWZPxg+To5LNYOLXj7t7sndcG/MmLbm/eWvdstb2VdL/zf8rm54
	 4kTL6U+tzu+AGpdx1MBekJYM41Cd9eVXDbxG64sHu6ppkTgqTB5B7CZAbRaDBsr4rT
	 m7E/x/bQsbVnh/2P6DyiAe1RRxGpMH36EMaTlJAMSTMkAhdYiAQBCgy6Xn6XzWI6Rj
	 R3xY0OBMgFdXw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AC4DADFF760;
	Fri, 26 Jan 2024 16:35:22 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: tools@kernel.org, nik.borisov@suse.com, tools@linux.kernel.org
Message-ID: <20240126-b218425-81d6f0159d3f@bugzilla.kernel.org>
In-Reply-To: <b93b0a56-0207-4538-9413-36d59c20ca2e@suse.com>
References: <b93b0a56-0207-4538-9413-36d59c20ca2e@suse.com>
Subject: Re: b4 diff failure scenario
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Fri, 26 Jan 2024 16:35:22 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=218425

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

