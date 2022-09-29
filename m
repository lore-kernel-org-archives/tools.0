Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CFB10F7
	for <tools@linux.kernel.org>; Thu, 29 Sep 2022 07:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77F82C433D6;
	Thu, 29 Sep 2022 07:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664437647;
	bh=WpNV+O0yOj4KJDbczknCr2GJCL8ElB6sobxW3Lala9Q=;
	h=Date:From:To:Cc:Subject:From;
	b=NgwEKRoO6wqJDt3gZEsOo7s8kXazjRCXyPXwkEzScRAhuD9PNsiH84k5NE9fDbZlF
	 zU3SskLsO3h5e/QJNgLxZLM9YoBpcvCcwm9IREeDVwak5SieJSwu/47+/ue4omyyAq
	 nTJ/5CVUuuV/Jj+dF6oYsgSK88Hb6I1lsqW/yW5Vb6yzYs47bVJmXSQfUHtcKaVhXq
	 KGx+6zXwPkBBkctqrw1NCqzrt8VnJaMPAzsxBezCIQKHCWHIkJWzYTa7lQjeU8cbZz
	 nFrR4tRUkwuYoYXWg0XaLCACRgDohMkpGnE9MqLvuUfcSYcExByPyP2fre9jWECkAw
	 FmSSht3Q2xQ6Q==
Date: Thu, 29 Sep 2022 09:47:17 +0200
From: Christian Brauner <brauner@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Preserving notes when updating trailers
Message-ID: <20220929074717.u2xfvfwq4ki732tw@wittgenstein>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hey Konstantin,

When updating trailers using b4 for a series git notes aren't preserved
for the individual commit messages. I have a work around for this. After
updating the trailers I can use filter-repo/commit_map which provides a
list of the old and new hashes. Then each line can simply be fed to git
notes copy. It'd be nice if b4 would be able do this natively e.g., by
having a command line option to preserve notes.

Christian

