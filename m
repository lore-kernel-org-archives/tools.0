Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65351E4A0
	for <tools@linux.kernel.org>; Thu, 23 May 2024 12:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716467426; cv=none; b=uHVfJcDBN4ZI5Ci+Jjwy4Criqw3C/X3NP6u4nw2qwPdNHBDcF9ys2OmbUP/k0hwBvE4dKMv1k1pdmMQjCcG0T5G8tidMt7kv8aWUZ4Wnie2vxFKJISHUo2vlegK+F4P+mf/H/GuYUmdlT1TVb9hoMCDpY+yvgJ3ceFN4vAWqVEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716467426; c=relaxed/simple;
	bh=FQqEHkJ3PjlYnZdHVtUJ2XrMoa9hn5CySDpEXjMNy2Q=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=FTE286/VmnEMH4S1hE4wDWwNv6tu8hYe3aknHPwnWvwjFcHgR28oY8UPy2QA0ZdSlPv0gIasC9qyMtFpEW2pDZuc+k3bCCMWXQau8QWrpfvTJewNiLR3iLXECzZkex42eHI+hypq88R/fHKjvl5tzI3YuFBwU2VgG+QjlBd42Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kzbKeqUA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kzbKeqUA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62885C2BD10;
	Thu, 23 May 2024 12:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716467426;
	bh=FQqEHkJ3PjlYnZdHVtUJ2XrMoa9hn5CySDpEXjMNy2Q=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=kzbKeqUAkQ0K0Q4wHIxLEL/bFlqpxIL91bGy99LlgVZgmXCdl6NLuah/C2pYjamNu
	 9KlrFrrcRGDI19TARdpKKG/jRfkPLZ9EjOXGH0/FOggbFn8/8N/0JGRwkUM2zP+bI+
	 1DP8Z6XHsW/QRb0jRjTSfJxZHJ9DmnutJaGj02I2l8Lo40DLFoEBsw9M/2IX6r74UE
	 vYpO2dKplNx9pyy23FmWvuHxh1sMn+H/VQ+WBS5LeajVJ+Vd/YrQGyVudph81O4VKm
	 W4mDlVufyvenKbaCHtY7EWiD/eTKcZRb7TxOkAJeYSa7FgHUK6YAsXi/INYru5Owur
	 xBkn/7c2JUs3g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4B5ABC43333;
	Thu, 23 May 2024 12:30:26 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: mkorpershoek@baylibre.com, tools@linux.kernel.org
Message-ID: <20240523-b218877-383ddd87fe72@bugzilla.kernel.org>
In-Reply-To: <87sey8yksi.fsf@baylibre.com>
References: <87sey8yksi.fsf@baylibre.com>
Subject: Re: b4 prep-perpatch-check-cmd conf via .b4-config
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Thu, 23 May 2024 12:30:26 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=218877

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

