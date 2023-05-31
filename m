Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B2A805
	for <tools@linux.kernel.org>; Wed, 31 May 2023 19:11:02 +0000 (UTC)
Received: from [192.168.2.32] ([87.132.200.153]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MILnm-1pq9nH45DQ-00EMyW for <tools@linux.kernel.org>; Wed, 31 May 2023
 20:58:00 +0200
Message-ID: <bdefe087-28a2-d541-933c-ccd743cc8b62@mweigand.net>
Date: Wed, 31 May 2023 20:57:58 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: tools@linux.kernel.org
From: Maximilian Weigand <mweigand@mweigand.net>
Subject: b4: workflow for selecting to/cc targets of individual patches
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:ezFj0QSUrL5dwUrLZ4S0uwqws/7Plv0rpbxWpivTclvKHEV0dyj
 ure/NiEVjCYilj2bBB/gPer+goQtYFWvFC065/agodIQdLmoFZ983DLeWmHzAE63+xcqlTk
 YTvppRiMv/1d3J/zULY9oSKoa7H6BcMJm7uXDZE3SSWhOUHbbIssALg7RsJbvNUxAiPC2qt
 w6P2pqliS1KhtV0+wcldg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FihqF035j+E=;ncXNISaublZfo6HAZPWRGgH5nfb
 kkfvD4ryK6qObd01+pTfKjRVk4aG6Opg9eiH3iOK/qJOa3hzr/OgFjNnTIfaxOIoo15kraABr
 CA9688JUSyVRUiQzknDFNslBpTnZHtPnjjiayXsqIwwbYZjnIEhdLxV5/crpDiRv0g9vcIYK+
 gFfQdmxJQ5yCpC2lJfLONvugy1O/gZS4fE5425YCagY6Psri3b7ggTh5TDZiPrXPMrM8xAle5
 7Y8yFqqR8k7Ck4YpsYovLiR+v9UVt2z9qI8DFsYP6x3+fB42fQvQ6LuTlsMB6A4Uj8M54DlWx
 M4NQdRHJiNLAY3mBwZSaoIDrRCVAxoImX5kbJBs/ZNvmE6ScfdG1n603hvyub3N92VCKZCmEy
 7YnWW4gLIWGVce7/WLGfyHX0isEg0Lk6jVLxleP12ZaOjSL6mt/tPFgYabJiCVBmxGw+Xjl1/
 4bGee5ASPYaFEX0nOHyMYVqlpIEm2J6ZFYoNzqzpRw6NqfoQEomm9d0XzNR+1Mz5ktX4mguN+
 /oteo2GFo5Ggg2nZg0U09gajL9tM6Hy0XEihqmaiSroRPQlsCXWIcMJ9MM9LJTj+NujQffwOX
 DZo3DIufVE8M65eeOHf2pcyE7DgpRCNCSXQUrcTJ9tkwhz6vMHDRuDSDkcu/9sI8LwVDcRVAq
 z94ZUnqHDZud41X3aIv0wjILNF0I3pWp5XiKIYdvLA==

Hi everyone,

as a very new and inexperienced patch submitter I am currently
struggling to properly prepare/submit a patch set where patches are
targeted at different maintainers and would be interested in the
proposed way to do this using b4:

My understanding (also from reading a bit in the tools archive) is that
the cover letter should be addressed to all maintainers and mailing
lists targeted in any of the patches, while individual patches should go
only to the maintainers (via To:) and lists (via Cc:) they are targeted at.

Using b4 prep --auto-to-cc is not an option here, as all To:/CC:
addresses in the cover letter will be used in all patches (my
understanding, based on b4 send --dry-run tests).

Therefore, the only way I currently see is to populate individual
commits/patches with To:/Cc: lines in their respective trailers, e.g.
based on suitable (manual) calls to get_maintainer.pl, such is used
internally by b4 prep --auto-to-cc. Is that the recommended way?

I have not seen many patches on the mailing lists that contain To:/Cc:
lines in their trailers and am wondering that behavior would be
acceptable? If yes, would it make sense to add functionality to b4 that
would populate individual patches with To:/Cc:, similar to --auto-to-cc
does for the cover letter?

Thank you very much for any help,

best regards

Maximilian
