Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B882D5421
	for <tools@linux.kernel.org>; Thu, 12 Jun 2025 20:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749760164; cv=none; b=H/MnBtTuJF0kwuGv540ZdsapgFzA2+DGLx6SpnMGIhw7TLEHJawrFKzzxNQvfnh0rL1WQQ0HFiuIOmYJlGyBxw0kXnwY7ESMW44PpIrfFl0FaMTREsLPoC1VYkv/wAi1Z0QAA0n9Sx9rHYaTRcR0esG1cf2Bf4a83aIrWqMDvXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749760164; c=relaxed/simple;
	bh=4lF0PkQzMcMZnRR0ckkXPFrlIUWUeEg9oJ74/K/CRKs=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jON7tHcj5UtZ8J9C5KSyCX+l29V+Hq8YLxzimzknhF6jmz8Mdr8hknd99ZasbE9ca9Zo/BHblZS5FQ4pYn9OegU3C6K0MtsyOLR8S8GMoLLdlS/zuLig8/v4ZTwL1N/6fZxsAY37X6p42uwKRkwud64qAO1YNdBQn+hMAnzwb+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dfcH3h4j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dfcH3h4j"
Received: by smtp.kernel.org (Postfix)
	id 37771C4CEF0; Thu, 12 Jun 2025 20:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC836C4CEEA;
	Thu, 12 Jun 2025 20:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749760164;
	bh=4lF0PkQzMcMZnRR0ckkXPFrlIUWUeEg9oJ74/K/CRKs=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=dfcH3h4jdXHxwSMld+vauCJj5dl/ErHkSp0tRVNOyAbphiwNSZsycaRUpr8fqO2Mx
	 HfBdOeoaLzTMO8P10xwk3Po5abuFU/2ls2JVa0LTYuwcxslhpwwQjbKqVbvbr9GvYW
	 lDcvufPPwvYzMtYaMTSR8iw/ntdEyd7XSoDQZ7mQ=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>
In-Reply-To: <20250612-prep-cache-v1-1-f80c50989c69@intel.com>
References: <20250612-prep-cache-v1-1-f80c50989c69@intel.com>
Subject: Re: [PATCH b4] prep: Rework --no-cache help message
Message-Id: <174976016356.4184023.17068203749249331846.b4-ty@linuxfoundation.org>
Date: Thu, 12 Jun 2025 16:29:23 -0400
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-b20ec


On Thu, 12 Jun 2025 11:17:05 -0700, Lucas De Marchi wrote:
> Reword it to be similar to the other commands: the cache is not used
> only for remote queries, but also when running local checks.
> 
> 

Applied, thanks!

[1/1] prep: Rework --no-cache help message
      commit: b20ecd560c74e663e2a1e79b12e6a89a70ee4be3

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

