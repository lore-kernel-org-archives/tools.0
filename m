Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7AC1F3D56;
	Mon, 17 Nov 2025 08:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763369167; cv=none; b=WQQf9mx/Irq+J+OHQBWn4k9QwSxPpbuwsB24K4VAL9ClVZVHfPG2KCSsAguwV0nsd8fvWCBJkGYRljVV8HPUY7OIjNr223D1Iyymrjz/PT8NahnsTSxA48zggNh0tdhyUGn6fnaSUCjaBkIDk5ZnTQrS6gJ3uMh3kQ97DP0mBzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763369167; c=relaxed/simple;
	bh=Fu0m+nvGmqpbOjvwGNRDzVkHa8+C/tO3tgvB2hEkmZY=;
	h=From:Date:MIME-Version:Content-Type:To:Message-ID:In-Reply-To:
	 References:Subject; b=AjwWPUKJQkRZod/ABmDl7yHGRAoVhv1X0SMhH+kUTPzR7eyTbPLr8900Xi5ovbBqlNICQ/tViP6vP+d7HiiEMmfK8TmFaCb9zL8y3enHgx5bt7zoDf9SOl7JL+eTeQ2l9aFQthXZBUh3IpbFdZsOPPa4VLptGOhuhOukKPy7BPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JgeamC4T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JgeamC4T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C002DC19424;
	Mon, 17 Nov 2025 08:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763369165;
	bh=Fu0m+nvGmqpbOjvwGNRDzVkHa8+C/tO3tgvB2hEkmZY=;
	h=From:Date:To:In-Reply-To:References:Subject:From;
	b=JgeamC4TTFhfH/4tR8307M0QFQD+zbyCRCWJrQ0Qgip7TWBpCxW+m35qrPPdmZ9OQ
	 lZJgIxlKs6a7Tp3JsBRqaXbcbGMeoKBk3c9PDOpFrZsD9oS42XqhnQ/ZWfDT1MhEKZ
	 RjDxMkuYSfhI7xIKnPPqTmbJJ5un/cOvQ6u1E5A2NxMj0epBXNwBgvOPvvN4rKp4fa
	 FwMzUD359c/j0bHMZRiFBD8n0LUNe2Dr/OinfgBPAdB4lo9pe6S7Qp6Aund6hx8CfT
	 lpmAIAQ7IMwTzLsQQzEkc6QwVOKbLQUdIV1xEd1Ye74QFQ2gl734soQbTZs01Qk/JX
	 40frJI3CRsdxw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EEEDB3A8255A;
	Mon, 17 Nov 2025 08:45:33 +0000 (UTC)
From: Louis Rannou via Bugspray Bot <bugbot@kernel.org>
Date: Mon, 17 Nov 2025 08:45:19 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: konstantin@linuxfoundation.org, erik.schilling@linaro.org, 
 tools@linux.kernel.org, bugs@lists.linux.dev
Message-ID: <20251117-b217642c5-5bfd2902810b@bugzilla.kernel.org>
In-Reply-To: <CTPW75Q2ISUN.251ELTNP6RB22@fedora>
References: <CTPW75Q2ISUN.251ELTNP6RB22@fedora>
Subject: Re: Allow sending prefixes before [PATCH]
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev

Louis Rannou writes via Kernel.org Bugzilla:

I suggested a new patch which includes Antonin's with a second patch to cover the sendreceive part.

I think this is the best solution, though there might also need a --postsubject to set some [] prefixes after the [PATCH ...]

However, it would be very nice to have this merged as it's block the usage of b4 on several projects (almost any yocto sublayers in my case).

https://lore.kernel.org/all/20251113-sub-v1-0-921bef0da4d2@non.se.com/

Unfortunately I have no solution to test that myself

View: https://bugzilla.kernel.org/show_bug.cgi?id=217642#c5
You can reply to this message to join the discussion.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

