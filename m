Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B9B38DF9
	for <tools@linux.kernel.org>; Wed, 22 Jan 2025 15:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737559726; cv=none; b=h9xX7cLqQr/+Z2rg+7AvmO+iGRG/w/BYNGw2KZsmsGcv6OuLtjizEp/0aDUGnCsHatrvLiLkGZ5P6mPQxtQ4E3oZAVXP3dDHU/o51Ut88AG1w2M4dLlixYOGNn/1w3R1V26XcJ5G+SNH87CeRJD04EKsfn20qfBnjgermpcTsXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737559726; c=relaxed/simple;
	bh=8sCnaC8dMIMrdKYwBZNvoRCHpf8PdSN7kZ71bHLCbIM=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HFGwGcQTHtJ8EPqMn8ST16zOsEel55seipmO+I+M2/xSpxXA/HROvyIghET/M5gMXxz5Cik6wfbY75wHuMIgjqTsgpb4oq1HZRw01yivNQptepF6yS1aWM9tBxeIW1vhSHVVg0DQV6hMekOe7G6hZMMtoe8K93x7VgSK0nknD5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wMxFYrVt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wMxFYrVt"
Received: by smtp.kernel.org (Postfix)
	id E7A12C4CEE4; Wed, 22 Jan 2025 15:28:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2E40C4CEE3;
	Wed, 22 Jan 2025 15:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737559725;
	bh=8sCnaC8dMIMrdKYwBZNvoRCHpf8PdSN7kZ71bHLCbIM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=wMxFYrVtf5enbEki5nribow6jkNhVcKvAipwxwbiHQuO30pcgmYtv7v/RCcBF0BW/
	 IOG3Z11yAMuC8ysuT8VyZmdNNe6DCwPxXP61kjPgTPhtWRzTSpEj2dc9A8SfhChOw0
	 xV9uply8h1kbfsj6ZQqHfr8ygfCpjLhPnqwR5hCU=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Tamir Duberstein <tamird@gmail.com>
In-Reply-To: <20241025-better-type-annotations-v1-0-9d7a00a8d754@gmail.com>
References: <20241025-better-type-annotations-v1-0-9d7a00a8d754@gmail.com>
Subject: Re: [PATCH b4 0/5] Resolve some static typing errors
Message-Id: <173755972553.457666.16721877756658243086.b4-ty@linuxfoundation.org>
Date: Wed, 22 Jan 2025 10:28:45 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-f5260


On Fri, 25 Oct 2024 16:16:02 -0400, Tamir Duberstein wrote:
> This series slightly improves the quality of type annotations in the
> project. It also adds development dependencies so they can more easily
> be installed.
> 
> Unfortunately this is only a drop in the bucket; there are still 356
> errors as reported by pyright. Without minimal tooling to ensure these
> don't gress, progress will be difficult.
> 
> [...]

Applied, thanks!

[1/5] Add development dependencies
      commit: 66fa5e85a5768f24687f806413a6ff3774d43f8c
[2/5] Avoid file descriptor leak
      commit: d99337f1aa6ec60398539d772c5eace25d665ac8
[3/5] Correctly type annotate generators
      commit: 2801becd386bf9b3c8947421f3ef20442def2a58
[4/5] Provide overloads for git_run_command
      commit: 846254faae45c20a1c0721d8c139c0b5d26a9bf2
[5/5] Add missing imports
      commit: 21904f395d068f0b957972d148fd5d326a904920

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

